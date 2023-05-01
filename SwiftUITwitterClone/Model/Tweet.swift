//
//  Tweet.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import SwiftUI

struct Tweet: Identifiable {
    var id = UUID()
    let date: String
    let text: String
    let images: [Image]?
    var likes: Int
    var retweets: Int
    var bookmarks: Int
    var views: Int
}

extension Tweet {
    
    static var forYouTweets: [Tweet] = [
        Tweet(date: "1m", text: "This is the most recent For You Tweet", images: nil, likes: 100, retweets: 12, bookmarks: 25, views: 200),
        Tweet(date: "2m", text: "This is another For You Tweet", images: nil, likes: 100, retweets: 12, bookmarks: 25, views: 200),
        Tweet(date: "5m", text: "It seems like you would like this tweet, so here is it on your For You page", images: nil, likes: 1005, retweets: 102, bookmarks: 75, views: 2000),
        Tweet(date: "10m", text: "This tweet is similar to tweets you have engaged with in the past", images: nil, likes: 50, retweets: 7, bookmarks: 22, views: 800),
        Tweet(date: "17m", text: "Do you like stuff like this?", images: nil, likes: 88, retweets: 5, bookmarks: 12, views: 422),
        Tweet(date: "25m", text: "You follow this page so we will sprinkle it in to your For You page.", images: nil, likes: 15, retweets: 1, bookmarks: 0, views: 85),
        Tweet(date: "1h", text: "This should be the last tweet in the For You Page", images: nil, likes: 100, retweets: 12, bookmarks: 25, views: 200)
    ]
    
    static var followingTweets: [Tweet] = [
        Tweet(date: "1m", text: "This is the most recent Following Tweet", images: nil, likes: 83, retweets: 5, bookmarks: 1, views: 212),
        Tweet(date: "2m", text: "This is another Following Tweet", images: nil, likes: 25, retweets: 2, bookmarks: 0, views: 452),
        Tweet(date: "5m", text: "You follow this user, so here is it on your Following page", images: nil, likes: 253, retweets: 12, bookmarks: 2, views: 2003),
        Tweet(date: "10m", text: "This tweet is similar to tweets you have engaged with in the past", images: nil, likes: 50, retweets: 7, bookmarks: 22, views: 800),
        Tweet(date: "17m", text: "Do you follow this user?", images: nil, likes: 8, retweets: 1, bookmarks: 0, views: 215),
        Tweet(date: "25m", text: "You follow this page so it has landed here on your Following page.", images: nil, likes: 12, retweets: 1, bookmarks: 0, views: 112),
        Tweet(date: "1h", text: "This should be the last tweet in the Following Page", images: nil, likes: 27, retweets: 5, bookmarks: 2, views: 200)
    ]
    
    static var userTweets: [Tweet] = [
        Tweet(date: "1m", text: "This is the most recent tweet by the user", images: nil, likes: 83, retweets: 5, bookmarks: 1, views: 212),
        Tweet(date: "2m", text: "This is another profile Tweet", images: nil, likes: 25, retweets: 2, bookmarks: 0, views: 452),
        Tweet(date: "5m", text: "This user tweeted this and therefore it shows up here", images: nil, likes: 253, retweets: 12, bookmarks: 2, views: 2003),
        Tweet(date: "10m", text: "This user has this to say about a certain topic", images: nil, likes: 50, retweets: 7, bookmarks: 22, views: 800),
        Tweet(date: "17m", text: "Was this posted by the correct user?", images: nil, likes: 8, retweets: 1, bookmarks: 0, views: 215),
        Tweet(date: "25m", text: "This user tweeted this 25m minutes ago and is very proud of it", images: nil, likes: 12, retweets: 1, bookmarks: 0, views: 112),
        Tweet(date: "1h", text: "This should be the last tweet in the user's tweets", images: nil, likes: 27, retweets: 5, bookmarks: 2, views: 200)
    ]
    
//    static var userReplies: [Tweet] = [
//        Tweet(date: "1m", text: "This is the most recent Following Tweet", images: nil, likes: 83, retweets: 5, bookmarks: 1, views: 212),
//        Tweet(date: "2m", text: "This is another Following Tweet", images: nil, likes: 25, retweets: 2, bookmarks: 0, views: 452),
//        Tweet(date: "5m", text: "You follow this user, so here is it on your Following page", images: nil, likes: 253, retweets: 12, bookmarks: 2, views: 2003),
//        Tweet(date: "10m", text: "This tweet is similar to tweets you have engaged with in the past", images: nil, likes: 50, retweets: 7, bookmarks: 22, views: 800),
//        Tweet(date: "17m", text: "Do you follow this user?", images: nil, likes: 8, retweets: 1, bookmarks: 0, views: 215),
//        Tweet(date: "25m", text: "You follow this page so it has landed here on your Following page.", images: nil, likes: 12, retweets: 1, bookmarks: 0, views: 112),
//        Tweet(date: "1h", text: "This should be the last tweet in the Following Page", images: nil, likes: 27, retweets: 5, bookmarks: 2, views: 200)
//    ]
//
//    static var userLikedTweets: [Tweet] = [
//        Tweet(date: "1m", text: "This is the most recent Following Tweet", images: nil, likes: 83, retweets: 5, bookmarks: 1, views: 212),
//        Tweet(date: "2m", text: "This is another Following Tweet", images: nil, likes: 25, retweets: 2, bookmarks: 0, views: 452),
//        Tweet(date: "5m", text: "You follow this user, so here is it on your Following page", images: nil, likes: 253, retweets: 12, bookmarks: 2, views: 2003),
//        Tweet(date: "10m", text: "This tweet is similar to tweets you have engaged with in the past", images: nil, likes: 50, retweets: 7, bookmarks: 22, views: 800),
//        Tweet(date: "17m", text: "Do you follow this user?", images: nil, likes: 8, retweets: 1, bookmarks: 0, views: 215),
//        Tweet(date: "25m", text: "You follow this page so it has landed here on your Following page.", images: nil, likes: 12, retweets: 1, bookmarks: 0, views: 112),
//        Tweet(date: "1h", text: "This should be the last tweet in the Following Page", images: nil, likes: 27, retweets: 5, bookmarks: 2, views: 200)
//    ]
}
