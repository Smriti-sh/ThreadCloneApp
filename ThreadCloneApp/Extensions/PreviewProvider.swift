//
//  PreviewProvider.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 17/02/25.
//

import SwiftUI

extension PreviewProvider{
    static var dev: DeveloperPreview{
        return DeveloperPreview.shared
    }
}

class DeveloperPreview{
    static let shared = DeveloperPreview()
    
    let user = User(id: "ABCD", fullname: "Monty", email: "abc@gmail.com", username: "Monty123")
}
