//
//  ContentView.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 09/09/2024.
//

import SwiftUI

struct RecipeSearchView: View {
    @State private var searchText = ""
    @State private var selectedFilter = "ALL"
    @StateObject var viewModel = RecipeViewModel()
    
    var body: some View {
        NavigationView { // Ensure to wrap the view in NavigationView
            VStack {
                TextField("Search for recipes...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                FilterBarView(selectedFilter: $selectedFilter) // Add FilterBarView here
                
                Button(action: {
                    let filters = selectedFilter == "ALL" ? [] : [selectedFilter]
                    viewModel.recipes.removeAll() // Clear previous results
                    viewModel.currentPage = 0 // Reset pagination
                    viewModel.searchRecipes(query: searchText, filters: filters)
                }) {
                    Text("Search")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                RecipeListView(recipes: viewModel.recipes, isLoading: viewModel.isLoading) {
                    let filters = selectedFilter == "ALL" ? [] : [selectedFilter]
                    viewModel.loadMore(query: searchText, filters: filters)
                }
            }
            .padding()
        }
    }
}



#Preview {
    RecipeSearchView()
}
