//
//  ExploreView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 29/01/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    
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
                .padding()
//                .padding(.top, 8)
//                .padding(.vertical)
                
                // Scrollable Content
                ScrollView {
                    LazyVStack {
//                        ForEach(0 ... 10, id: \.self) { user in
                        ForEach(viewModel.users) { user in
                            NavigationLink(value: user){
                                VStack {
                                    UserCell(user: user)
                                    
                                    Divider()
                                }
                                .padding(.vertical,4)
                            }
                        }
                    }
                }
                .navigationDestination(for: User.self, destination:{ user in
                    ProfileView(user: user)
                }).foregroundColor(.black)
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
