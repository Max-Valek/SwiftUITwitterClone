//
//  SampleUsers.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import Foundation


let sampleUsers: [User] = [User.dogeUser, User.elonUser, User.defaultUser]

/*
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
 */
extension User {
    
    static var dogeUser = User(
        displayName: "Doge",
        username: "@doge",
        profilePhoto: "doge",
        location: "Dogeland",
        following: 1,
        followers: 100,
        tweets: Tweet.dogeTweets,
        replies: nil,
        likedPosts: nil)
    
    static var elonUser = User(
        displayName: "Elon Musk",
        username: "@elon",
        profilePhoto: "elon",
        location: "Twitter",
        following: 1,
        followers: 1000,
        tweets: Tweet.elonTweets,
        replies: nil,
        likedPosts: nil)
    
    static var defaultUser = User(
        displayName: "Default User",
        username: "@default",
        profilePhoto: "default",
        location: "Default Location",
        following: 0,
        followers: 0,
        tweets: Tweet.defaultTweets,
        replies: nil,
        likedPosts: nil)
    
}

extension Tweet {
    
    static var dogeTweets: [Tweet] = [
        Tweet(date: "1m", text: "This is the most recent tweet by Doge", images: nil, likes: 83, retweets: 5, bookmarks: 1, views: 212),
        Tweet(date: "2m", text: "This is another profile Tweet", images: nil, likes: 25, retweets: 2, bookmarks: 0, views: 452),
        Tweet(date: "5m", text: "Doge tweeted this and therefore it shows up here", images: nil, likes: 253, retweets: 12, bookmarks: 2, views: 2003),
        Tweet(date: "10m", text: "Doge has this to say about a certain topic", images: nil, likes: 50, retweets: 7, bookmarks: 22, views: 800),
        Tweet(date: "17m", text: "Was this posted by the correct user (Doge)?", images: nil, likes: 8, retweets: 1, bookmarks: 0, views: 215),
        Tweet(date: "25m", text: "Doge tweeted this 25m minutes ago and is very proud of it", images: nil, likes: 12, retweets: 1, bookmarks: 0, views: 112),
        Tweet(date: "1h", text: "This should be the last tweet in Doge's tweets", images: nil, likes: 27, retweets: 5, bookmarks: 2, views: 200)
    ]

    static var elonTweets: [Tweet] = [
        Tweet(date: "1m", text: "This is the most recent tweet by Elon", images: nil, likes: 83, retweets: 5, bookmarks: 1, views: 212),
        Tweet(date: "2m", text: "This is another profile Tweet", images: nil, likes: 25, retweets: 2, bookmarks: 0, views: 452),
        Tweet(date: "5m", text: "Elon tweeted this and therefore it shows up here", images: nil, likes: 253, retweets: 12, bookmarks: 2, views: 2003),
        Tweet(date: "10m", text: "Elon has this to say about a certain topic", images: nil, likes: 50, retweets: 7, bookmarks: 22, views: 800),
        Tweet(date: "17m", text: "Was this posted by the correct user (Elon)?", images: nil, likes: 8, retweets: 1, bookmarks: 0, views: 215),
        Tweet(date: "25m", text: "Elon tweeted this 25m minutes ago and is very proud of it", images: nil, likes: 12, retweets: 1, bookmarks: 0, views: 112),
        Tweet(date: "1h", text: "This should be the last tweet in Elon's tweets", images: nil, likes: 27, retweets: 5, bookmarks: 2, views: 200)
    ]
    
    static var defaultTweets: [Tweet] = [
        Tweet(date: "1m", text: "This is the most recent tweet by Default", images: nil, likes: 83, retweets: 5, bookmarks: 1, views: 212),
        Tweet(date: "2m", text: "This is another profile Tweet", images: nil, likes: 25, retweets: 2, bookmarks: 0, views: 452),
        Tweet(date: "5m", text: "Default tweeted this and therefore it shows up here", images: nil, likes: 253, retweets: 12, bookmarks: 2, views: 2003),
        Tweet(date: "10m", text: "Default has this to say about a certain topic", images: nil, likes: 50, retweets: 7, bookmarks: 22, views: 800),
        Tweet(date: "17m", text: "Was this posted by the correct user (Default)?", images: nil, likes: 8, retweets: 1, bookmarks: 0, views: 215),
        Tweet(date: "25m", text: "Default tweeted this 25m minutes ago and is very proud of it", images: nil, likes: 12, retweets: 1, bookmarks: 0, views: 112),
        Tweet(date: "1h", text: "This should be the last tweet in Default's tweets", images: nil, likes: 27, retweets: 5, bookmarks: 2, views: 200)
    ]
}
