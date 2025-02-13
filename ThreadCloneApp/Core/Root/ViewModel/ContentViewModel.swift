//
//  ContentViewModel.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 12/02/25.
//
//this file helps us to fgure out which view to route the user to

import Foundation
//to listen when user session receives a value through @Published
import Combine
import FirebaseAuth

class ContentViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    //to store the result of sink in a cancellable set
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setUpSubscribers()
    }
    private func setUpSubscribers(){
        //weak self to avoid retain cycle
        AuthService.shared.$userSession.sink{[weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
 
