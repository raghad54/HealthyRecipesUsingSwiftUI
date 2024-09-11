//
//  RecipeViewModel.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 09/09/2024.
//


import Foundation
import Combine

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading: Bool = false
    private var cancellable: AnyCancellable?
    private var currentPage = 0
    private let pageSize = 10
    private var hasMore = true
    
    func searchRecipes(query: String, filters: [String] = []) {
        guard !query.isEmpty else { return }
        self.isLoading = true
        self.currentPage = 0
        self.hasMore = true
        self.recipes.removeAll()
        
        performRequest(query: query, filters: filters)
    }
    
    func loadMore(query: String, filters: [String] = []) {
        guard hasMore, !isLoading else { return }
        self.isLoading = true
        performRequest(query: query, filters: filters)
    }
    
    private func performRequest(query: String, filters: [String] = []) {
        guard hasMore else {
            self.isLoading = false
            return
        }
        
        var urlString = "https://api.edamam.com/api/recipes/v2?type=public&q=\(query)&app_id=d168beb6&app_key=c34c72f75e414c5440fec053992c3e18"
        
        for filter in filters {
            urlString += "&health=\(filter.replacingOccurrences(of: " ", with: "-").lowercased())"
        }
        
        urlString += "&from=\(currentPage * pageSize)&to=\((currentPage + 1) * pageSize)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            self.isLoading = false
            return
        }
        
        let publisher: AnyPublisher<RecipeResponse, URLError> = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: RecipeResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .mapError { URLError(_nsError: $0 as NSError) }
            .eraseToAnyPublisher()
        
        cancellable?.cancel()
        
        cancellable = publisher
            .catch { error -> Just<RecipeResponse> in
                print("Error fetching recipes: \(error)")
                return Just(RecipeResponse(hits: []))
            }
            .map { response in
                self.hasMore = response.hits.count == self.pageSize
                self.currentPage += 1
                print("Response: \(response)")
                return response.hits.compactMap { hit in
                    Recipe(
                        id: UUID(),
                        label: hit.recipe.label,
                        image: hit.recipe.image,
                        source: hit.recipe.source,
                        calories: hit.recipe.calories,
                        totalWeight: hit.recipe.totalWeight,
                        totalTime: hit.recipe.totalTime
                    )
                }
            }
            .sink(receiveValue: { [weak self] newRecipes in
                self?.recipes.append(contentsOf: newRecipes)
                self?.isLoading = false
            })
    }
}

