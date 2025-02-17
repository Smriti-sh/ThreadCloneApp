//
//  User.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 13/02/25.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
    
    // Custom initializer with default values for optional fields
        init(id: String, fullname: String, email: String, username: String, profileImageUrl: String? = nil, bio: String? = nil) {
            self.id = id
            self.fullname = fullname
            self.email = email
            self.username = username
            self.profileImageUrl = profileImageUrl
            self.bio = bio
        }
}

