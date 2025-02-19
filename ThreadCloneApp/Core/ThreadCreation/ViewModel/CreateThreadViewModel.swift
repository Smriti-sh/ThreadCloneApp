//
//  CreateThreadViewModel.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 19/02/25.
//

import Foundation
import Firebase
import FirebaseAuth

class CreateThreadViewModel: ObservableObject{
    
//    @Published var caption = ""
    
    func uploadThread(caption: String) async throws{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
        
    }
}
