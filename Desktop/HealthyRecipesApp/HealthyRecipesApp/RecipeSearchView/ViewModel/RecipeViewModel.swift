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
    @Published var isLoading = false
    @Published var currentPage = 0
    var hasMore = true
    private let pageSize = 10
    private var cancellable: AnyCancellable?

    func searchRecipes(query: String, filters: [String] = []) {
        self.currentPage = 0
        self.recipes = []
        loadMore(query: query, filters: filters)
    }

    func loadMore(query: String, filters: [String] = []) {
        guard !isLoading && hasMore else { return }
        isLoading = true

        var urlString = "https://api.edamam.com/api/recipes/v2?type=public&q=\(query)&app_id=d168beb6&app_key=c34c72f75e414c5440fec053992c3e18"

        for filter in filters {
            urlString += "&health=\(filter.replacingOccurrences(of: " ", with: "-").lowercased())"
        }

        // Add pagination parameters
        urlString += "&from=\(currentPage * pageSize)&to=\((currentPage + 1) * pageSize)"

        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            isLoading = false
            return
        }

        print("Fetching URL: \(url)")

        // Define the publisher with a general error type
        let publisher: AnyPublisher<RecipeResponse, URLError> = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: RecipeResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .mapError { error in
                return URLError(_nsError: error as NSError)
            }
            .eraseToAnyPublisher()

        // Cancel any previous request
        cancellable?.cancel()

        cancellable = publisher
            .catch { error -> Just<RecipeResponse> in
                print("Error fetching recipes: \(error)")
                return Just(RecipeResponse(hits: []))
            }
            .map { response -> [Recipe] in
                self.hasMore = response.hits.count == self.pageSize
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
                self?.currentPage += 1
                self?.isLoading = false
            })
    }
}
