//
//  ThreadView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 29/01/25.
//

import SwiftUI

struct CreateThreadView: View {
    @StateObject var viewModel = CreateThreadViewModel()
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    private var user: User?{
        return UserService.shared.currentUser
    }
    
    var body: some View {
        
        NavigationStack{
            VStack{
                HStack(alignment: .top){
                    CircularProfileImageView(user: user, size: .small)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        TextField("Start a Thread...", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    //to reset post content
                    if !caption.isEmpty{
                        Button{
                            caption = ""
                        }label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width:12, height:12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Post"){
                        Task{
                            try await viewModel.uploadThread(caption: caption)
                            dismiss()
                        }
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    CreateThreadView()
}
