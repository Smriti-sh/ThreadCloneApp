//
//  Timestamp.swift
//  ThreadCloneApp
//
//  Created by Smriti Sharma on 19/02/25.
//

import Foundation
import Firebase

extension Timestamp{
    func timeStampToString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute,.hour,.day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
