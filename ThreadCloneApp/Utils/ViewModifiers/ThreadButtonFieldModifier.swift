//
//  ThreadButtonFieldModifier.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 28/01/25.
//

import SwiftUI

struct ThreadButtonFieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 352, height: 44)
            .background(.black)
            .cornerRadius(8)
    }
}
