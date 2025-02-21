//
//  ThreadService.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 19/02/25.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

struct ThreadService {
    static func uploadThread(_ thread : Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else {return}
                try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
        //to get most recent threads first
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({try? $0.data(as: Thread.self) })
    }
    
    //to fetch threads belonging to a certain user
    static func fetchUserThreads(uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
        //when u filter down by field you no longer get the ability to order
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        
        //sorting manually
        let threads = snapshot.documents.compactMap({try? $0.data(as: Thread.self) })
        return threads.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue()})
    }
    
//    static func toggleLike(threadID: String, userID: String) async throws {
//            let threadRef = Firestore.firestore().collection("threads").document(threadID)
//            
//            try await Firestore.firestore().runTransaction { transaction, errorPointer in
//                do {
//                    let threadDocument = try transaction.getDocument(threadRef)
//                    
//                    guard var threadData = threadDocument.data() else {
//                        throw NSError(domain: "ThreadService", code: 1, userInfo: [NSLocalizedDescriptionKey: "Thread data not found"])
//                    }
//                    
//                    var likedBy = threadData["likedBy"] as? [String] ?? []
//                    var likeCount = threadData["likes"] as? Int ?? 0
//                    
//                    if likedBy.contains(userID) {
//                        likedBy.removeAll { $0 == userID }
//                        likeCount -= 1
//                    } else {
//                        likedBy.append(userID)
//                        likeCount += 1
//                    }
//                    
//                    threadData["likedBy"] = likedBy
//                    threadData["likes"] = likeCount
//                    
//                    transaction.setData(threadData, forDocument: threadRef)
//                    return nil
//                } catch {
//                    errorPointer?.pointee = error as NSError
//                    return nil
//                }
//            }
//        }
}

 

