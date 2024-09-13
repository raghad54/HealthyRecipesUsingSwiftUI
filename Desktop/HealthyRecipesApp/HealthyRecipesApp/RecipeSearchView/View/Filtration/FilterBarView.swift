//
//  FilterBarView.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 09/09/2024.
//

import SwiftUI

struct FilterBarView: View {
    @Binding var selectedFilter: String
    var onFilterChange: (String) -> Void
    
    let filters = ["ALL", "Low Sugar", "Dairy-Free" ,"Vegan"] 
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(filters, id: \.self) { filter in
                    Button(action: {
                        selectedFilter = filter
                        onFilterChange(filter)
                    }) {
                        Text(filter)
                            .padding(.horizontal, 16) 
                            .padding(.vertical, 8)
                            .background(selectedFilter == filter ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .shadow(radius: 2) 
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    FilterBarView(selectedFilter: .constant("ALL")) { _ in
    }
}
