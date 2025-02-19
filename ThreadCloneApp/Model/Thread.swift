//
//  Thread.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 19/02/25.
//

import Firebase
import FirebaseFirestore

struct Thread: Identifiable, Codable {
    @DocumentID var threadID : String?
//    var id: String
    var ownerUid: String
    var caption: String
    var timestamp: Timestamp
    var likes: Int
    
    var id: String{
        return threadID ?? NSUUID().uuidString
    }
    
    var user: User?
}
 
