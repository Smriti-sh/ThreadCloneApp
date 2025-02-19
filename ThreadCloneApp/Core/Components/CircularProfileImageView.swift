//
//  CircularProfileImageView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 08/02/25.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize{
    case xxSmall
    case xsmall
    case small
    case medium
    case large
    case xLarge
    
    var dimensions: CGFloat{
        switch self {
        case .xxSmall:
            return 28
        case .xsmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 48
        case .large:
            return 64
        case .xLarge:
            return 80
        }
    }
}

struct CircularProfileImageView: View {
    var user: User?
    let size: ProfileImageSize
    
//    init(user:User?){
//        self.user = user
//    }
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl{
            KFImage(URL(string: imageUrl)!)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimensions, height: size.dimensions)
                .clipShape(Circle())
        }else{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimensions, height: size.dimensions)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

//#Preview {
//    CircularProfileImageView()
//}
struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user : DeveloperPreview.shared.user, size: .medium)
    }
}
