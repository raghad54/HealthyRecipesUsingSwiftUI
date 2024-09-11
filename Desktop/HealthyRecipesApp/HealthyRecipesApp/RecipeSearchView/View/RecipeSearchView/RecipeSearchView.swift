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
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
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
                    isLoading: viewModel.isLoading
                )
            }
            .padding()
            .navigationTitle("Recipes")
        }
    }
    
    private func performSearch() {
        let filters = selectedFilter == "ALL" ? [] : [selectedFilter]
        viewModel.searchRecipes(query: searchText, filters: filters)
    }
}




#Preview {
    RecipeSearchView()
}
