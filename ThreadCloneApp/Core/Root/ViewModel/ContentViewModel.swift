//
//  ContentViewModel.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 12/02/25.
//
//this file helps us to fgure out which view to route the user to

import Foundation
//to listen when user session receives a value through @Published
import Combine  // Allows reactive programming with @Published and sink.
import Firebase
import FirebaseAuth

class ContentViewModel: ObservableObject{
    //ObservableObject makes this class bindable in SwiftUI.
    
    //When @Published properties change, SwiftUI automatically updates the UI.
    //@Published: Marks userSession as observable //FirebaseAuth.User?: Stores the currently logged-in user (or nil if logged out).
    @Published var userSession: FirebaseAuth.User?
    //to store the result of sink in a cancellable set
    private var cancellables = Set<AnyCancellable>()
    
    //When ContentViewModel is created, it automatically starts listening for user session changes by calling setUpSubscribers().
    init(){
        setUpSubscribers()
    }
    private func setUpSubscribers(){
        //sink subscribes to changes in userSession.
//        userSession is updated whenever AuthService emits a new value.
//        [weak self] prevents strong reference cycles (memory leaks).
        AuthService.shared.$userSession.sink{[weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
 
