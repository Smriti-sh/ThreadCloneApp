//
//  CircularProfileImageView.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 08/02/25.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("kiki")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

//#Preview {
//    CircularProfileImageView()
//}
struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView()
    }
}
