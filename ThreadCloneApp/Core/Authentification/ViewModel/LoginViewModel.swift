//
//  LoginViewModel.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 13/02/25.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
 
