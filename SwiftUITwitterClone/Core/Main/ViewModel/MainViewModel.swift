//
//  MainViewModel.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/2/23.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    // array of every tweet (for now)
    @Published var allTweets: [Tweet] = []
    // tweets posted by user
    @Published var userTweets: [Tweet] = []
    // show logged in user's profile
    @Published var showProfile: Bool = false
    // show tweet author's profile
    @Published var showTweetAuthorProfile: Bool = false
    // create new tweet
    @Published var showNewTweetView: Bool = false
    // when tweet is clicked
    @Published var showTweetDetail: Bool = false
    // service ot fetch tweets
    @StateObject var tweetService = TweetService()
    // which user is logged in
    let loggedInUser = User.doge
    // user that is selected (going to their profile, need?)
    @Published var selectedUser: User?
    
    init() {
        fetchAllTweets()
    }
    
    // fetch all tweets using TweetService class
    func fetchAllTweets() {
        allTweets = tweetService.fetchAllTweets()
    }
    
    // fetch a user's tweets
    func fetchUserTweets(user: User) {
        userTweets = tweetService.fetchTweetsByUser(user: user)
    }
}
