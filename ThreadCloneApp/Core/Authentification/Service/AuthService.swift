//
//  AuthService.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 12/02/25.
//

import FirebaseAuth

class AuthService {
    
    //userSession is used to track check whether the user is logged in or not
    //publishing this property becoz we want to be able to send thst notification of when it receives a value to other views
    @Published var userSession: FirebaseAuth.User?

    static let shared = AuthService()
    
    init(){
        //if this has a value we know the user is logged in
        self.userSession = Auth.auth().currentUser
    }
    
     @MainActor
     func login (withEmail email: String, password: String) async throws {
         do {
             let result = try await Auth.auth().signIn(withEmail: email, password: password)
             self.userSession = result.user
             print("DEBUG: Created user \(result.user.uid)")
         } catch {
             print("DEBUG: Failed to create user with error \(error.localizedDescription)")
         }
     }
    
     @MainActor
     func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user 
            print("DEBUG: Created user \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
     }
    
    func signOut(){
        try? Auth.auth().signOut()  //signs out on backend
        self.userSession = nil  //removes session locally and updates routing
    }
}


//AuthService --> ContentViewModel --> ContentView
