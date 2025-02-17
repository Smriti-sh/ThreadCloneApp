//
//  UserService.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 15/02/25.
//

import Firebase
//import Foundation
import FirebaseFirestore
import FirebaseAuth

class UserService{
    @Published var currentUser : User?
    
    //static let shared creates a singleton instance of UserService. & This ensures only one instance of UserService exists throughout the app.
    static let shared = UserService()
    
    init(){
        Task{ try await fetchCurrentUser()}
    }
    
    @MainActor
        func fetchCurrentUser() async throws {
            guard let uid = Auth.auth().currentUser?.uid else {return}
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            let user = try snapshot.data(as: User.self)
            self.currentUser = user
            
            print("DEBUG: User is \(user)")
        }
    
    func reset(){
        self.currentUser = nil 
    }
}

//snapshot = snapshot is an instance of DocumentSnapshot.  It represents a document in Firestore, containing its data and metadata.
