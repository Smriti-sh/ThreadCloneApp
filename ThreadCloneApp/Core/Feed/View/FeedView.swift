//
//  FeedView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 29/01/25.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                LazyVStack{
                    ForEach(0 ... 10, id: \.self){thread in
                        ThreadCell()
                        
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
