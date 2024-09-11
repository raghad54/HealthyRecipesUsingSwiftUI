//
//  RecipeDetailView.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 09/09/2024.
//

import SwiftUI


struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
                .cornerRadius(10)
                .padding()

                Text(recipe.label)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding([.leading, .trailing])
                
                HStack {
                    Text("Calories: \(String(format: "%.2f", recipe.calories))")
                    Spacer()
                    Text("Total Weight: \(String(format: "%.2f", recipe.totalWeight)) g")
                }
                .font(.subheadline)
                .padding([.leading, .trailing, .top])
                
                if recipe.totalTime > 0 {
                    Text("Total Time: \(Int(recipe.totalTime)) minutes")
                        .font(.subheadline)
                        .padding([.leading, .trailing, .top])
                } else {
                    Text("Total Time: 0.0")
                        .font(.subheadline)
                        .padding([.leading, .trailing, .top])
                }
                
                Spacer()
            }
            .navigationTitle(recipe.label)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}




