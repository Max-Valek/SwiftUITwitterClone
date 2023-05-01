//
//  User.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var displayName: String
    var username: String
    var tweets: [Tweet]
    var replies: [Tweet]
    var likedPosts: [Tweet]
}
