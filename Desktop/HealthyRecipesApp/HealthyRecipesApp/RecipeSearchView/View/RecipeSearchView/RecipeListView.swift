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
    @Binding var isLoading: Bool
    @State private var scrollViewOffset: CGFloat = 0
    var searchText: String // To check if searchText is empty
    
    var body: some View {
        GeometryReader { geometry in
            List {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        RecipeRow(recipe: recipe)
                    }
                }
                
                if isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                }
            }
            .background(GeometryReader { innerGeometry in
                Color.clear
                    .preference(key: ScrollOffsetPreferenceKey.self, value: innerGeometry.frame(in: .global).maxY)
            })
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                scrollViewOffset = value
                if isNearBottom(geometry: geometry) && !searchText.isEmpty {
                    loadMore() // Only load more if searchText is not empty
                }
            }
        }
    }
    
    private func isNearBottom(geometry: GeometryProxy) -> Bool {
        let threshold: CGFloat = 50
        let contentHeight = geometry.size.height
        let scrollViewHeight = geometry.size.height
        return (scrollViewOffset + scrollViewHeight) > contentHeight - threshold
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
