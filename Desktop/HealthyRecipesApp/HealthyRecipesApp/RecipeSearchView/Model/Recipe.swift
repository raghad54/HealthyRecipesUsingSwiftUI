//
//  Recipe.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 09/09/2024.
//

import Foundation

struct Recipe: Codable, Identifiable, Equatable {
    var id: UUID?
    let label: String
    let image: String
    let source: String
    let calories: Double
    let totalWeight: Double
    let totalTime: Double

    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.id == rhs.id // Compare by unique identifier (id)
    }
}
