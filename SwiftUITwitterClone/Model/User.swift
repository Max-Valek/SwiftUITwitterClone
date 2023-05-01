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
    var profilePhoto: Image?
    var location: String?
    // let dateJoined: String
    var following: Int
    var followers: Int
    var tweets: [Tweet]?
    var replies: [Tweet]?
    var likedPosts: [Tweet]?
}

extension User {
    
    static var dogeUser = User(displayName: "Doge", username: "@doge", location: "Dogeland", following: 1, followers: 100, tweets: Tweet.userTweets, replies: nil, likedPosts: nil)
}
