//
//  User.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var displayName: String
    var username: String
    var profilePhoto: String?
    var bio: String?
    var location: String?
    // let dateJoined: String
    var following: Int
    var followers: Int
}

//extension User: Equatable {
//    
//    static func ==(lhs: User, rhs: User) -> Bool {
//        if lhs.id == rhs.id {
//            return true
//        } else {
//            return false
//        }
//    }
//}

extension User {
    
    static let doge: User = User(displayName: "Doge", username: "doge", profilePhoto: "doge", bio: "The mascot for Dogecoin: a cryptocurrency.", location: "Dogeland", following: 1, followers: 999)
    
}
