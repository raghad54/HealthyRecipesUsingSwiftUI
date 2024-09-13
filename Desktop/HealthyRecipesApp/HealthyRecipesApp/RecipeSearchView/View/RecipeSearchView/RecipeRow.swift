//
//  RecipeRow.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 10/09/2024.
//

import SwiftUI

struct RecipeRow: View {
    let recipe: Recipe

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(recipe.label)
                    .font(.headline)
                Text(recipe.source)
                    .font(.subheadline)
            }
        }
    }
}
