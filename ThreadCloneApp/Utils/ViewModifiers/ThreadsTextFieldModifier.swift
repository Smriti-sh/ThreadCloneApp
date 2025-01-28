//
//  ThreadsTextFieldModifier.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 28/01/25.
//

import SwiftUI

struct ThreadsTextFieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal,24)
    }
}
