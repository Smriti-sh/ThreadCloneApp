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
    @Published var selectedItem: PhotosPickerItem? {
        didSet{ Task { await loadImage() } }
    }
    @Published var profileImage: Image?
    
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
    
    //to set the selected image as DP
    private func loadImage() async{
        guard let item = selectedItem else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        profileImage = Image(uiImage: uiImage)
    }
}
 
