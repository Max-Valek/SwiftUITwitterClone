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

extension User {
    
    static let doge: User = User(displayName: "Doge", username: "doge", profilePhoto: "doge", bio: "The mascot for Dogecoin: a cryptocurrency.", location: "Dogeland", following: 1, followers: 999)
    
    static let elon: User = User(displayName: "Elon Musk", username: "elon", profilePhoto: "elon", bio: "Owner of Twitter", location: "Twitter", following: 1, followers: 100)
    
    static let defaultUser: User = User(displayName: "Default User", username: "default", profilePhoto: "default", bio: "Default Twitter user", location: "Everywhere", following: 0, followers: 0)
}
