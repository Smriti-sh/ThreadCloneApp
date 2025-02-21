//
//  Thread.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 19/02/25.
//

import Firebase
import FirebaseFirestore
import FirebaseAuth

struct Thread: Identifiable, Codable {
    @DocumentID var threadID : String?
//    var id: String
    var ownerUid: String
    var caption: String
    var timestamp: Timestamp
    var likes: Int
//    var likedBy: [String] = [] // Store user IDs who liked this post
    
    var id: String{
        return threadID ?? NSUUID().uuidString
    }
    
    var user: User?
    
//    var isLiked: Bool {
//            guard let currentUserID = Auth.auth().currentUser?.uid else { return false }
//            return likedBy.contains(currentUserID)
//        }
}
 
