//
//  ProfileView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 29/01/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        // width of screen/no. of cases & 10-10 padding on both side
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
        
        NavigationStack{
            ScrollView(showsIndicators: true){
                
                VStack (spacing: 20){
                    HStack(alignment: .top){
                        //bio and stats
                        VStack(alignment: .leading,spacing: 12){
                            //fullname and username
                            VStack(alignment: .leading, spacing: 4){
                                Text("Kiki's Service")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text("Kiki'sService01")
                                    .font(.subheadline)
                            }
                            Text("A witch character for Ghibli movie")
                                .font(.footnote)
                            
                            Text("2 Followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                        }
                        Spacer()
                        
                        CircularProfileImageView()
                    }
                }
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
                    VStack{
                        HStack{
                            ForEach(ProfileThreadFilter.allCases){ filter in
                                VStack{
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    
                                    if selectedFilter == filter{
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(width: filterBarWidth, height: 1)
                                            //for sliding transition
                                            .matchedGeometryEffect(id: "filter", in: animation)
                                    }else{
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: filterBarWidth, height: 1)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        selectedFilter = filter
                                    }
                                }
                            }
                        }
                        LazyVStack{
                            ForEach(0 ... 10, id: \.self){ thread in
                                ThreadCell()
                            }
                        }
                    }
                    .padding(.vertical,8)
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        AuthService.shared.signOut()
                    }label:{
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ProfileView()
}
