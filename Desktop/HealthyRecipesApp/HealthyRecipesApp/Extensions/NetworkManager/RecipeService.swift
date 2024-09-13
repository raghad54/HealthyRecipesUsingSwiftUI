//
//  RecipeService.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 09/09/2024.
//

import Foundation
import Combine

class RecipeService: RecipeServiceProtocol {
    func fetchRecipes(query: String, filters: [String], from: Int, to: Int) -> AnyPublisher<[Recipe], Error> {
        var urlString = "https://api.edamam.com/api/recipes/v2?type=public&q=\(query)&app_id=d168beb6&app_key=c34c72f75e414c5440fec053992c3e18"
        
        for filter in filters {
            urlString += "&health=\(filter.replacingOccurrences(of: " ", with: "-").lowercased())"
        }
        
        urlString += "&from=\(from)&to=\(to)"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: RecipeResponse.self, decoder: JSONDecoder())
            .map { $0.hits.compactMap { hit in
                Recipe(
                    id: UUID(),
                    label: hit.recipe.label,
                    image: hit.recipe.image,
                    source: hit.recipe.source,
                    calories: hit.recipe.calories,
                    totalWeight: hit.recipe.totalWeight,
                    totalTime: hit.recipe.totalTime
                )
            }}
            .eraseToAnyPublisher()
    }
}
