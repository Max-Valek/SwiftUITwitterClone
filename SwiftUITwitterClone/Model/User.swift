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
    var tweets: [Tweet]
    var replies: [Tweet]
    var likedPosts: [Tweet]
}
