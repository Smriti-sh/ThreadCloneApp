//
//  FeedViewModel.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 19/02/25.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject{
    
    @Published var threads = [Thread]()
    
    init() {
        Task{try await fetchThreads()}
    }
    
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThreads()
    }
    
    private func fetchUserDataForThreads() async throws{
//        for thread in threads{
//            let ownerUid = thread.ownerUid
//            let threadUser = try await UserService.fetchUser(withUid: ownerUid)
//        }
        for i in 0 ..< threads.count{
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadUser = try await UserService.fetchUser(withUid: ownerUid)
            
            threads[i].user = threadUser
        }
    }
}
