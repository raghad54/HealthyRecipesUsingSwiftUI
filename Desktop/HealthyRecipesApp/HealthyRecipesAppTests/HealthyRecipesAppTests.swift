//
//  HealthyRecipesAppTests.swift
//  HealthyRecipesAppTests
//
//  Created by Raghad's Mac on 09/09/2024.
//

import XCTest
@testable import HealthyRecipesApp
import Combine

final class HealthyRecipesAppTests: XCTestCase {
    class MockRecipeService: RecipeServiceProtocol {
        func fetchRecipes(query: String, filters: [String], from: Int, to: Int) -> AnyPublisher<[Recipe], Error> {
            let mockRecipes = [Recipe(id: UUID(), label: "Test Recipe", image: "", source: "Test Source", calories: 100, totalWeight: 200, totalTime: 10)]
            return Just(mockRecipes)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
    
}
