//
//  ProfileView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 29/01/25.
//

import SwiftUI
import Foundation

struct ProfileView: View {
    let user: User
    //    @StateObject var viewModel = ProfileViewModel()
    //    @State private var selectedFilter: ProfileThreadFilter = .threads
    //    @Namespace var animation
    //
    //    private var filterBarWidth: CGFloat {
    //        let count = CGFloat(ProfileThreadFilter.allCases.count)
    //        // width of screen/no. of cases & 10-10 padding on both side
    //        return UIScreen.main.bounds.width / count - 16
    //    }
    
    //for changing hard coded data to dynamic
    //    private var currentUser : User?{
    //        return viewModel.currentUser
    //    }
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            
            VStack (spacing: 20){
                ProfileHeaderView(user: user)
                
                Button{
                    
                }label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                        .padding(.top,8)
                }
                
                //user content and list view
                UserContentListView(user: user)
            }
            
        }
//        .navigationBarTitleDisplayMode(.inline)
//        .toolbar{
//            ToolbarItem(placement: .navigationBarTrailing){
//                Button{
//                    AuthService.shared.signOut()
//                }label:{
//                    Image(systemName: "line.3.horizontal")
//                        .foregroundColor(.black)
//                }
//            }
//        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

#Preview {
    //    ProfileView(user: dev.user)
    ProfileView(user: DeveloperPreview.shared.user)
}

//you cannot navigate from root view thats inside navigation stack to another child view thats also inside naviagtion stack
