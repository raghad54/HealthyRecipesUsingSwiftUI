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
    @StateObject var viewModel = RecipeViewModel(recipeService: RecipeService())
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search for recipes...", text: $searchText, onCommit: {
                        performSearch()
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    
                    Button(action: {
                        performSearch()
                    }) {
                    Image(systemName: "magnifyingglass")
                        .padding()
                        .background(searchText.isEmpty ? Color.gray : Color.blue) // Change color based on state
                        .foregroundColor(.white)
                        .cornerRadius(10)
                   }
                  .frame(width: 44, height: 44)
                  .disabled(searchText.isEmpty) // Disable button if searchText is empty
            }
                
                FilterBarView(selectedFilter: $selectedFilter, onFilterChange: { filter in
                    self.selectedFilter = filter
                    performSearch()
                })
                
                RecipeListView(
                    recipes: viewModel.recipes,
                    loadMore: {
                        let filters = selectedFilter == "ALL" ? [] : [selectedFilter]
                        viewModel.loadMore(query: searchText, filters: filters)
                    },
                    isLoading: $viewModel.isLoading, searchText: self.searchText 
                )
            }
            .padding()
            .navigationTitle("Recipes")
        }
    }
    
    // Function to handle search
    private func performSearch() {
        let filters = selectedFilter == "ALL" ? [] : [selectedFilter]
        viewModel.recipes.removeAll()
        viewModel.currentPage = 0
        viewModel.searchRecipes(query: searchText, filters: filters)
    }
}




#Preview {
    RecipeSearchView()
}
