//
//  FeedView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 29/01/25.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                LazyVStack{
                    ForEach(viewModel.threads){thread in
                        ThreadCell(thread: thread)
                        
                    }
                }
            }
            .refreshable {
                print("DEBUG: Refresh Hive")
            }
            .navigationTitle("Hive")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                    
                }label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

//#Preview {
//    FeedView()
//}
struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            FeedView()
        }
    }
}
