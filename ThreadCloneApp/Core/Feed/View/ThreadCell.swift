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
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray2))
                        
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
