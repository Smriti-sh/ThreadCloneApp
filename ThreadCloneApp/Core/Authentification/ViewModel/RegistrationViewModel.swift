//
//  RegistrationViewModel.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 12/02/25.
//

import Foundation

class RegistrationViewModel: ObservableObject{
    @Published var email = ""
    @Published var fullname = ""
    @Published var username = ""
    @Published var password = ""
    
    @MainActor
    func createUser() async throws{
        try await AuthService.shared.createUser(
                   withEmail: email,
                   password: password,
                   fullname: fullname,
                   username: username
                   )
    }
}


 
