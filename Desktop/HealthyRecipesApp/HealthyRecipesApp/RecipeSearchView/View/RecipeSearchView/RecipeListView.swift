//
//  RecipeListView.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 09/09/2024.
//

import SwiftUI

struct RecipeListView: View {
    let recipes: [Recipe]
    let loadMore: () -> Void
    let isLoading: Bool
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    RecipeRow(recipe: recipe)
                }
                .onAppear {
                    if recipe == recipes.last {
                        loadMore()
                    }
                }
            }
            
            if isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity)
            }
        }
        .onAppear {
            // Optionally, trigger load more when the view appears
            loadMore()
        }
        .onChange(of: recipes.count) { _ in
            // Trigger load more when user scrolls close to the end of the list
            if isNearBottom() {
                loadMore()
            }
        }
    }
    
    private func isNearBottom() -> Bool {
        // Check if the user is close to the bottom of the list
        let listHeight = UIScreen.main.bounds.height
        let bottomEdge = listHeight + 100 // Adjust as needed
        return bottomEdge >= UIScreen.main.bounds.height
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
