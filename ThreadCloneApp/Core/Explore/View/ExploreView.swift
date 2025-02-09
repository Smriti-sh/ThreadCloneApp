//
//  ExploreView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 29/01/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $searchText)
                        .padding(.vertical, 8)
                }
                .padding(.horizontal)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemGray6)))
                .padding(.horizontal)
//                .padding(.top, 8)
                .padding(.vertical)
                
                // Scrollable Content
                ScrollView {
                    LazyVStack {
                        ForEach(0 ... 10, id: \.self) { user in
                            VStack {
                                UserCell()
                                
                                Divider()
                            }
                            .padding(.vertical,4)
                        }
                    }
                }
            }
            .navigationTitle("Explore")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
