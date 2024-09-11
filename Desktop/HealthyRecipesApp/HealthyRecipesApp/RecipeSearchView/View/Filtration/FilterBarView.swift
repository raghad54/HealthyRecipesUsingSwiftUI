//
//  FilterBarView.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 09/09/2024.
//

import SwiftUI

import SwiftUI

struct FilterBarView: View {
    @Binding var selectedFilter: String
    var onFilterChange: (String) -> Void
    
    let filters = ["ALL", "Low Sugar", "Dairy-Free" ,"Vegan"] // Example filters
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(filters, id: \.self) { filter in
                    Button(action: {
                        selectedFilter = filter
                        onFilterChange(filter)
                    }) {
                        Text(filter)
                            .padding(.horizontal, 16) // Adjust padding to fit text
                            .padding(.vertical, 8) // Add vertical padding for height
                            .background(selectedFilter == filter ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .clipShape(Capsule()) // Rounded edges
                            .shadow(radius: 2) // Optional: Add a shadow for better visibility
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}



#Preview {
    FilterBarView(selectedFilter: .constant("ALL")) { _ in
        // No action needed for preview
    }
}
