////
////  FeedViewModel.swift
////  ThreadCloneApp
////
////  Created by Smriti Sharma on 19/02/25.
////
//
//import Foundation
//
//@MainActor
//class FeedViewModel: ObservableObject{
//    
//    @Published var threads = [Thread]()
//    
//    init() {
//        Task{try await fetchThreads()}
//    }
//    
//    func fetchThreads() async throws {
//        self.threads = try await ThreadService.fetchThreads()
//        try await fetchUserDataForThreads()
//    }
//    
//    private func fetchUserDataForThreads() async throws{
////        for thread in threads{
////            let ownerUid = thread.ownerUid
////            let threadUser = try await UserService.fetchUser(withUid: ownerUid)
////        }
//        for i in 0 ..< threads.count{
//            let thread = threads[i]
//            let ownerUid = thread.ownerUid
//            let threadUser = try await UserService.fetchUser(withUid: ownerUid)
//            
//            threads[i].user = threadUser
//        }
//    }
//}

//
//  FeedViewModel.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 19/02/25.
//

import Foundation
import Firebase

@MainActor
class FeedViewModel: ObservableObject {
    
    @Published var threads = [Thread]()
    
    init() {
        Task { await fetchThreads() }
    }
    
    func fetchThreads() async {
        do {
            let fetchedThreads = try await ThreadService.fetchThreads()
            
            // Ensure UI updates happen on the main thread
            await MainActor.run {
                self.threads = fetchedThreads
            }
            
            // Fetch user data for each thread
            await fetchUserDataForThreads()
            
        } catch {
            print("Error fetching threads: \(error.localizedDescription)")
        }
    }
    
    private func fetchUserDataForThreads() async {
        await withCheckedContinuation { continuation in
            Task {
                do {
                    for i in threads.indices {
                        let ownerUid = threads[i].ownerUid
                        let threadUser = try await UserService.fetchUser(withUid: ownerUid)
                        
                        await MainActor.run {
                            self.threads[i].user = threadUser
                        }
                    }
                    continuation.resume()
                } catch {
                    print("Error fetching user data: \(error.localizedDescription)")
                    continuation.resume()
                }
            }
        }
    }
}
