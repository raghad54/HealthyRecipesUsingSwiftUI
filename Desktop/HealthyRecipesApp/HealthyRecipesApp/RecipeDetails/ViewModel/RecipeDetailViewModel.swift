//
//  RecipeDetailViewModel.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 11/09/2024.
//

import Foundation
import SwiftUI

class RecipeDetailViewModel: ObservableObject {
    @Published var recipe: Recipe

    init(recipe: Recipe) {
        self.recipe = recipe
    }

    var formattedCalories: String {
        return String(format: "%.2f cal / %.2f g", recipe.calories, recipe.totalWeight)
    }

    var formattedTotalTime: String {
        return recipe.totalTime > 0 ? "\(Int(recipe.totalTime)) minutes" : "0.0"
    }
}
