//
//  RecipeDetailView.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 11/09/2024.
//

import SwiftUI

struct RecipeDetailView: View {
    @StateObject private var viewModel: RecipeDetailViewModel

    init(recipe: Recipe) {
        _viewModel = StateObject(wrappedValue: RecipeDetailViewModel(recipe: recipe))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: viewModel.recipe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
                .cornerRadius(10)
                .padding()

                Text(viewModel.recipe.label)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding([.leading, .trailing])

                VStack(alignment: .leading, spacing: 4) {
                    Text("Calories: \(viewModel.formattedCalories)")
                        .font(.subheadline)
                        .padding([.leading, .trailing, .top], 4)

                    Text("Total Time: \(viewModel.formattedTotalTime)")
                        .font(.subheadline)
                        .padding([.leading, .trailing, .top], 4)
                }
                .font(.system(size: 16)) 
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
            }
            .navigationTitle(viewModel.recipe.label)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
