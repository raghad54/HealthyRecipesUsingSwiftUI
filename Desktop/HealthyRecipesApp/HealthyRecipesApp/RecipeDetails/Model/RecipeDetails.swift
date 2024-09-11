//
//  RecipeDetails.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 09/09/2024.
//

import Foundation


struct RecipeResponse: Codable {
    let hits: [Hit]
}

struct Hit: Codable {
    let recipe: Recipe
}

//struct RecipeDetails: Codable, Identifiable {
//    let id: String = UUID().uuidString
//    let label: String
//    let image: String
//    let calories: Double
//    let totalWeight: Double
//    let totalTime: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case label
//        case image
//        case calories
//        case totalWeight
//        case totalTime
//    }
//}

//struct RecipeResponse: Codable {
//    let from, to, count: Int?
//    let links: WelcomeLinks?
//    let hits: [Hit]?
//
//    enum CodingKeys: String, CodingKey {
//        case from, to, count
//        case links
//        case hits
//    }
//}
//
//// MARK: - Hit
//struct Hit: Codable {
//    let recipe: Recipe?
//    let links: HitLinks?
//
//    enum CodingKeys: String, CodingKey {
//        case recipe
//        case links
//    }
//}
//
//// MARK: - HitLinks
//struct HitLinks: Codable {
//    let linksSelf: Next?
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf
//    }
//}
//
//// MARK: - Next
//struct Next: Codable {
//    let href: String?
//    let title: Title?
//}
//
//enum Title: String, Codable {
//    case nextPage = "Next page"
//    case titleSelf = "Self"
//}
//
//// MARK: - Recipe
//struct Recipe: Codable, Identifiable {
//    var id :UUID
//    let uri: String?
//    let label: String?
//    let image: String?
//    let images: Images?
//    let source: String?
//    let url: String?
//    let shareAs: String?
//    let yield: Int?
//    let dietLabels: [DietLabel]?
//    let healthLabels: [String]?
//    let cautions: [Caution]?
//    let ingredientLines: [String]?
//    let ingredients: [Ingredient]?
//    let calories, totalCO2Emissions: Double?
//    let co2EmissionsClass: Co2EmissionsClass?
//    let totalWeight: Double?
//    let totalTime: Int?
//    let cuisineType, mealType, dishType: [String]?
//    let totalNutrients, totalDaily: [String: Total]?
//    let digest: [Digest]?
//    let tags: [String]?
//}
//
//enum Caution: String, Codable {
//    case gluten = "Gluten"
//    case sulfites = "Sulfites"
//    case wheat = "Wheat"
//}
//
//enum Co2EmissionsClass: String, Codable {
//    case d = "D"
//    case e = "E"
//    case f = "F"
//    case g = "G"
//}
//
//enum DietLabel: String, Codable {
//    case balanced = "Balanced"
//    case highFiber = "High-Fiber"
//    case lowCarb = "Low-Carb"
//}
//
//// MARK: - Digest
//struct Digest: Codable {
//    let label: Label?
//    let tag: String?
//    let schemaOrgTag: SchemaOrgTag?
//    let total: Double?
//    let hasRDI: Bool?
//    let daily: Double?
//    let unit: Unit?
//    let sub: [Digest]?
//}
//
//enum Label: String, Codable {
//    case calcium = "Calcium"
//    case carbohydratesNet = "Carbohydrates (net)"
//    case carbs = "Carbs"
//    case carbsNet = "Carbs (net)"
//    case cholesterol = "Cholesterol"
//    case energy = "Energy"
//    case fat = "Fat"
//    case fiber = "Fiber"
//    case folateEquivalentTotal = "Folate equivalent (total)"
//    case folateFood = "Folate (food)"
//    case folicAcid = "Folic acid"
//    case iron = "Iron"
//    case magnesium = "Magnesium"
//    case monounsaturated = "Monounsaturated"
//    case niacinB3 = "Niacin (B3)"
//    case phosphorus = "Phosphorus"
//    case polyunsaturated = "Polyunsaturated"
//    case potassium = "Potassium"
//    case protein = "Protein"
//    case riboflavinB2 = "Riboflavin (B2)"
//    case saturated = "Saturated"
//    case sodium = "Sodium"
//    case sugarAlcohols = "Sugar alcohols"
//    case sugars = "Sugars"
//    case sugarsAdded = "Sugars, added"
//    case thiaminB1 = "Thiamin (B1)"
//    case trans = "Trans"
//    case vitaminA = "Vitamin A"
//    case vitaminB12 = "Vitamin B12"
//    case vitaminB6 = "Vitamin B6"
//    case vitaminC = "Vitamin C"
//    case vitaminD = "Vitamin D"
//    case vitaminE = "Vitamin E"
//    case vitaminK = "Vitamin K"
//    case water = "Water"
//    case zinc = "Zinc"
//}
//
//enum SchemaOrgTag: String, Codable {
//    case carbohydrateContent = "carbohydrateContent"
//    case cholesterolContent = "cholesterolContent"
//    case fatContent = "fatContent"
//    case fiberContent = "fiberContent"
//    case proteinContent = "proteinContent"
//    case saturatedFatContent = "saturatedFatContent"
//    case sodiumContent = "sodiumContent"
//    case sugarContent = "sugarContent"
//    case transFatContent = "transFatContent"
//}
//
//enum Unit: String, Codable {
//    case empty = "%"
//    case g = "g"
//    case kcal = "kcal"
//    case mg = "mg"
//    case µg = "µg"
//}
//
//// MARK: - Images
//struct Images: Codable {
//    let thumbnail, small, regular, large: Large?
//
//    enum CodingKeys: String, CodingKey {
//        case thumbnail
//        case small
//        case regular
//        case large
//    }
//}
//
//// MARK: - Large
//struct Large: Codable {
//    let url: String?
//    let width, height: Int?
//}
//
//// MARK: - Ingredient
//struct Ingredient: Codable {
//    let text: String?
//    let quantity: Double?
//    let measure: String?
//    let food: String?
//    let weight: Double?
//    let foodCategory, foodID: String?
//    let image: String?
//
//    enum CodingKeys: String, CodingKey {
//        case text, quantity, measure, food, weight, foodCategory
//        case foodID
//        case image
//    }
//}
//
//// MARK: - Total
//struct Total: Codable {
//    let label: Label?
//    let quantity: Double?
//    let unit: Unit?
//}
//
//// MARK: - WelcomeLinks
//struct WelcomeLinks: Codable {
//    let next: Next?
//}
