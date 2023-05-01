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

extension User {
    
    static var sampleUsers: [User] = [
        User(
            displayName: "Sample User",
            username: "@user",
            tweets: [
                Tweet(date: "1m", text: "This is Sample User's first tweet", images: nil, likes: 10, retweets: 1, bookmarks: 0, views: 200),
                Tweet(date: "2m", text: "This is Sample User's second tweet", images: nil, likes: 10, retweets: 1, bookmarks: 0, views: 200),
                Tweet(date: "3m", text: "This is Sample User's third tweet", images: nil, likes: 10, retweets: 1, bookmarks: 0, views: 200),
                Tweet(date: "4m", text: "This is Sample User's fourth tweet", images: nil, likes: 10, retweets: 1, bookmarks: 0, views: 200)
            ],
            replies: [],
            likedPosts: []),
        User(
            displayName: "Sample User 2",
            username: "@user2",
            tweets: [
                Tweet(date: "1m", text: "This is Sample User 2's first tweet", images: nil, likes: 10, retweets: 1, bookmarks: 0, views: 200),
                Tweet(date: "2m", text: "This is Sample User 2's second tweet", images: nil, likes: 10, retweets: 1, bookmarks: 0, views: 200),
                Tweet(date: "3m", text: "This is Sample User 2's third tweet", images: nil, likes: 10, retweets: 1, bookmarks: 0, views: 200),
                Tweet(date: "4m", text: "This is Sample User 2's fourth tweet", images: nil, likes: 10, retweets: 1, bookmarks: 0, views: 200)
            ],
            replies: [],
            likedPosts: []),
        User(
            displayName: "Sample User 3",
            username: "@user3",
            tweets: [
                Tweet(date: "1m", text: "This is Sample User 3's first tweet", images: nil, likes: 10, retweets: 1, bookmarks: 0, views: 200),
                Tweet(date: "2m", text: "This is Sample User 3's second tweet", images: nil, likes: 10, retweets: 1, bookmarks: 0, views: 200),
                Tweet(date: "3m", text: "This is Sample User 3's third tweet", images: nil, likes: 10, retweets: 1, bookmarks: 0, views: 200),
                Tweet(date: "4m", text: "This is Sample User 3's fourth tweet", images: nil, likes: 10, retweets: 1, bookmarks: 0, views: 200)
            ],
            replies: [],
            likedPosts: [])
    ]
}
