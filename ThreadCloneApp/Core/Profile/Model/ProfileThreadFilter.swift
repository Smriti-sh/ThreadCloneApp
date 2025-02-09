//
//  ProfileThreadFilter.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 09/02/25.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable{
    case threads
    case replies
    case likes
    //case tags
    
    var title: String {
        switch self {
        case .threads:
            return "Threads"
        case .replies:
            return "Replies"
        case .likes:
            return "Likes"
        //case .replies: return "Tags"
        }
    }
    var id: Int {return self.rawValue}
}
