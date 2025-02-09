//
//  UserCell.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 08/02/25.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView()
            
            VStack(alignment: .leading) {
                Text("Kiki'sService01")
                    .fontWeight(.semibold)
                Text("Ghibli slice of life")
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
        UserCell()
    }
}
