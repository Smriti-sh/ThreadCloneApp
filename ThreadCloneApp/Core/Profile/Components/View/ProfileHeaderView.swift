//
//  ProfileHeaderView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 19/02/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user:User?
    
    init(user:User?){
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top){
            //bio and stats
            VStack(alignment: .leading,spacing: 12){
                //fullname and username
                VStack(alignment: .leading, spacing: 4){
//                                Text("Kiki's Service")
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                //bio is in if condition because if there is no bio then there wont be empty space in profile
                if let bio = user?.bio{
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("2 Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
        }
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.shared.user)
}
