//
//  ThreadCell.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 08/02/25.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 12){
//                Image("kiki")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 40, height: 40)
//                    .clipShape(Circle())
                CircularProfileImageView(user: thread.user,size: .small)
                
                VStack(alignment: .leading, spacing: 4){
                    HStack{
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(thread.timestamp.timeStampToString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button{
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16){
                        
                        Button{
                            
                        }label: {
                            Image(systemName: "heart")
                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "bubble.left")
                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                    
                }
                    
            }
            Divider()
        }
        .padding()
    }
}

//#Preview {
//    ThreadCell()
//}
struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell(thread: dev.thread)
    }
}

//
//import SwiftUI
//import Firebase
//import FirebaseAuth
//
//struct ThreadCell: View {
//    @State var thread: Thread
//    @State private var isLiked: Bool
//    @State private var likeCount: Int
//    
//    init(thread: Thread) {
//        self.thread = thread
//        _isLiked = State(initialValue: thread.isLiked)
//        _likeCount = State(initialValue: thread.likes)
//    }
//    
//    var body: some View {
//        VStack {
//            HStack(alignment: .top, spacing: 12) {
//                CircularProfileImageView(user: thread.user, size: .small)
//                
//                VStack(alignment: .leading, spacing: 4) {
//                    HStack {
//                        Text(thread.user?.username ?? "")
//                            .font(.footnote)
//                            .fontWeight(.semibold)
//                        
//                        Spacer()
//                        
//                        Text(thread.timestamp.timeStampToString())
//                            .font(.caption)
//                            .foregroundColor(Color(.systemGray3))
//                        
//                        Button {
//                            // Handle options menu (delete/edit)
//                        } label: {
//                            Image(systemName: "ellipsis")
//                                .foregroundColor(Color(.darkGray))
//                        }
//                    }
//                    
//                    Text(thread.caption)
//                        .font(.footnote)
//                        .multilineTextAlignment(.leading)
//                    
//                    HStack(spacing: 16) {
//                        // **Heart (Like) Button**
//                        Button {
//                            Task {
//                                await toggleLike()
//                            }
//                        } label: {
//                            Image(systemName: isLiked ? "heart.fill" : "heart")
//                                .foregroundColor(isLiked ? .red : .black)
//                        }
//                        
//                        // **Comment Button**
//                        Button {
//                            // Handle comment action
//                        } label: {
//                            Image(systemName: "bubble.left")
//                        }
//                        
//                        // **Repost Button**
//                        Button {
//                            // Handle repost action
//                        } label: {
//                            Image(systemName: "arrow.rectanglepath")
//                        }
//                        
//                        // **Share Button**
//                        Button {
//                            // Handle share action
//                        } label: {
//                            Image(systemName: "paperplane")
//                        }
//                    }
//                    .foregroundColor(.black)
//                    .padding(.vertical, 8)
//                    
//                    // Display Like Count
//                    if likeCount > 0 {
//                        Text("\(likeCount) likes")
//                            .font(.caption)
//                            .fontWeight(.semibold)
//                    }
//                }
//            }
//            Divider()
//        }
//        .padding()
//    }
//    
//    // **Toggle Like/Unlike Functionality**
//    private func toggleLike() async {
//            guard let currentUserID = Auth.auth().currentUser?.uid else { return }
//            guard let threadID = thread.threadID else { return }
//            
//            do {
//                try await ThreadService.toggleLike(threadID: threadID, userID: currentUserID)
//                isLiked.toggle()
//                likeCount += isLiked ? 1 : -1
//            } catch {
//                print("Error: \(error.localizedDescription)")
//            }
//        }
//}
//
//struct ThreadCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ThreadCell(thread: DeveloperPreview.shared.thread)
//    }
//}
