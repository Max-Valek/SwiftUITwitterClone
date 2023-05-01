//
//  ProfileViewModel.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    let allTweets: [Tweet] = [
        Tweet(author: User.doge, date: "1m", text: "This is the most recent Following Tweet", images: nil, likes: 83, retweets: 5, bookmarks: 1, views: 212),
        Tweet(author: User.doge, date: "2m", text: "This is another Following Tweet", images: nil, likes: 25, retweets: 2, bookmarks: 0, views: 452),
        Tweet(author: User.doge, date: "5m", text: "You follow this user, so here is it on your Following page", images: nil, likes: 253, retweets: 12, bookmarks: 2, views: 2003),
        Tweet(author: User.doge, date: "10m", text: "This tweet is similar to tweets you have engaged with in the past", images: nil, likes: 50, retweets: 7, bookmarks: 22, views: 800),
        Tweet(author: User.doge, date: "17m", text: "Do you follow this user?", images: nil, likes: 8, retweets: 1, bookmarks: 0, views: 215),
        Tweet(author: User.doge, date: "25m", text: "You follow this page so it has landed here on your Following page.", images: nil, likes: 12, retweets: 1, bookmarks: 0, views: 112),
        Tweet(author: User.doge, date: "1h", text: "This should be the last tweet in the Following Page", images: nil, likes: 27, retweets: 5, bookmarks: 2, views: 200)
    ]
    
    @Published var userTweets: [Tweet] = []
    
    let user = User.doge
    
    init() {
        fetchUserTweets()
    }
    
    func fetchUserTweets(){
        
        allTweets.forEach { tweet in
            if tweet.author.id == user.id {
                self.userTweets.append(tweet)
            }
        }
    }
}
