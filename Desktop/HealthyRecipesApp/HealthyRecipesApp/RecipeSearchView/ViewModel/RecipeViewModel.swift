//
//  RecipeViewModel.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 09/09/2024.
//

import Foundation
import Combine

protocol RecipeServiceProtocol {
    func fetchRecipes(query: String, filters: [String], from: Int, to: Int) -> AnyPublisher<[Recipe], Error>
}

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?

    private var cancellable: AnyCancellable?
    private let recipeService: RecipeServiceProtocol
    var currentPage = 0
    private let pageSize = 10
    private var hasMore = true

    init(recipeService: RecipeServiceProtocol) {
        self.recipeService = recipeService
    }

    func searchRecipes(query: String, filters: [String] = []) {
        guard !query.isEmpty else { return }
        resetState()
        fetchRecipes(query: query, filters: filters)
    }

    func loadMore(query: String, filters: [String] = []) {
        guard hasMore, !isLoading else { return }
        fetchRecipes(query: query, filters: filters)
    }

    private func fetchRecipes(query: String, filters: [String]) {
        isLoading = true
        cancellable?.cancel()  // Cancel previous request if any

        cancellable = recipeService.fetchRecipes(
            query: query,
            filters: filters,
            from: currentPage * pageSize,
            to: (currentPage + 1) * pageSize
        )
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] completion in
            guard let self = self else { return }
            self.isLoading = false
            switch completion {
            case .failure(let error):
                self.error = error
                print("Error fetching recipes: \(error)")
            case .finished:
                break
            }
        }, receiveValue: { [weak self] newRecipes in
            guard let self = self else { return }
            self.hasMore = newRecipes.count == self.pageSize
            self.currentPage += 1
            self.recipes.append(contentsOf: newRecipes)
        })
    }

    private func resetState() {
        self.isLoading = false
        self.currentPage = 0
        self.hasMore = true
        self.recipes.removeAll()
    }
}
