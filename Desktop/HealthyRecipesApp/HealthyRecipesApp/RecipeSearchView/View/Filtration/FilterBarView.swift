//
//  FilterBarView.swift
//  HealthyRecipesApp
//
//  Created by Raghad's Mac on 09/09/2024.
//

import SwiftUI

struct FilterBarView: View {
    @Binding var selectedFilter: String
    
    let filters = ["ALL", "Low Sugar", "Dairy-Free", "Vegan"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filters, id: \.self) { filter in
                    Button(action: {
                        selectedFilter = filter
                    }) {
                        Text(filter)
                            .padding()
                            .background(selectedFilter == filter ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    FilterBarView(selectedFilter: .constant("ALL"))
}
