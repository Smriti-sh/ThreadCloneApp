//
//  EditProfileViewModel.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 19/02/25.
//

import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject{
    
    @Published var selectedItem: PhotosPickerItem? {
        didSet{ Task { await loadImage() } }
    }
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    
    func updateUserData() async throws{
//        print("DEBUG: update user data here")
        try await updateProfileImage()
    }
    
    //to set the selected image as DP
    @MainActor
    private func loadImage() async{
        guard let item = selectedItem else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        profileImage = Image(uiImage: uiImage)
    }
    
    private func updateProfileImage() async throws{
        guard let image = self.uiImage else {return}
        guard let imageurl = try? await ImageUploader.uploadImage(image) else {return}
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageurl)
    }
}
