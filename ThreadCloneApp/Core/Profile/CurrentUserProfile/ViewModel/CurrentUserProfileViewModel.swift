//
//  ProfileViewModel.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 15/02/25.
//

//import Foundation
//import Combine
//
//class ProfileViewModel: ObservableObject{
//    @Published var currentUser: User?
//    
//    init() {
//        setUpSubscribers()
//    }
//    
//    private func setUpSubscribers() {
//        UserService.shared.$currentUser.sink{ [weak self] user in
//            self?.currentUser = user
//            print("DEBUG: User in view model from combine is \(user)")
//        }
//    }
//}


import Foundation
import Combine
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        setUpSubscribers()
    }
    
    private func setUpSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
//            .receive(on: DispatchQueue.main) // Ensure updates happen on the main thread
                self?.currentUser = user
//                print("DEBUG: User in view model from Combine is \(String(describing: user))")
            }
            .store(in: &cancellables)  // Store the subscription
    }
    
}
 
