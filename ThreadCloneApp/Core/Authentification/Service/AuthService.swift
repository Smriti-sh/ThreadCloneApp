//
//  AuthService.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 12/02/25.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore    //provides encoding & decoding capability

class AuthService {
      
    //userSession is used to track check whether the user is logged in or not
    //publishing this property becoz we want to be able to send thst notification of when it receives a value to other views
    @Published var userSession: FirebaseAuth.User?

    static let shared = AuthService()
    
    init(){
        //if this has a value we know the user is logged in
        self.userSession = Auth.auth().currentUser
    }
    
//    Ensures that the function runs on the main thread. & help ensure your UI is always updated on the main thread
     @MainActor
     func login (withEmail email: String, password: String) async throws {
         do {
             let result = try await Auth.auth().signIn(withEmail: email, password: password)
             self.userSession = result.user
             try await UserService.shared.fetchCurrentUser()
//             print("DEBUG: Created user \(result.user.uid)")
         } catch {
             print("DEBUG: Failed to create user with error \(error.localizedDescription)")
         }
     }
    
    
     @MainActor
     func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
//            print("DEBUG: Created user \(result.user.uid)")
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
     }
    
    
    func signOut(){
        try? Auth.auth().signOut()  //signs out on backend
        self.userSession = nil  //removes session locally and updates routing
        UserService.shared.reset() //to remove the last user logged in details or set currentUser to nil
    }
    
    
    //function to insert user data once the account is created
    @MainActor
    private func uploadUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String
//        profileImageUrl: nil,  // Provide nil for optional fields
//        bio: nil
    )async throws{
//        let user = User(id: id, fullname: fullname, email: email, username: username)
//        This line creates an instance of a User object
        let user = User(id: id, fullname: fullname, email: email, username: username)
        // encode the user object into a Data format that Firestore can store.
        guard let userData = try? Firestore.Encoder().encode(user) else {return}
        // Upload the data to Firestore
        //.setData(userData) uploads the userData to Firestore for the specified document. If the document doesn’t exist, it will be created.
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user   //hatho haath current user update krdo
    }
}


//AuthService --> ContentViewModel --> ContentView
