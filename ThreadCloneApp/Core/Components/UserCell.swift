//
//  UserCell.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 08/02/25.
//

import SwiftUI

struct UserCell: View {
    let user : User
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .small)
            
            VStack(alignment: .leading, spacing:2) {
                Text(user.username)
                    .fontWeight(.semibold)
                Text(user.fullname)
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    UserCell()
//}
struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user : dev.user)
    }
}
