//
//  ExploreViewModel.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 17/02/25.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var users = [User]()
    
    init() {
        Task{ try await fetchUsers()}
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
