//
//  RecipeListView.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 09/09/2024.
//

import SwiftUI

struct RecipeListView: View {
    let recipes: [Recipe]
    let isLoading: Bool
    let loadMore: () -> Void

    var body: some View {
           List {
               ForEach(recipes) { recipe in
                   NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                       RecipeRow(recipe: recipe) // Custom row view
                   }
                   .onAppear {
                       if recipe == recipes.last {
                           loadMore() // Load more when the last item appears
                       }
                   }
               }
               
               // Show loading indicator if more data is being loaded
               if isLoading {
                   ProgressView()
                       .frame(maxWidth: .infinity)
               }
           }
       }
}

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
