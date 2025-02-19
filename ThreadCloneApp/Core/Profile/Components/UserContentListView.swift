//
//  UserContentListView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 19/02/25.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        // width of screen/no. of cases & 10-10 padding on both side
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
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
//                    ThreadCell()
                }
            }
        }
        .padding(.vertical,8)
    }
}

#Preview {
    UserContentListView()
}
