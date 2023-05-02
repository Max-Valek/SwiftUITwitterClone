//
//  MainViewModel.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/2/23.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var allTweets: [Tweet] = []
    @Published var userTweets: [Tweet] = []
    @Published var showProfile: Bool = false
    @Published var showTweetAuthorProfile: Bool = false
    @Published var showNewTweetView: Bool = false
    
    @StateObject var tweetService = TweetService()
    
    let loggedInUser = User.doge
    @Published var selectedUser: User?
    
    init() {
        fetchAllTweets()
    }
    
    func fetchAllTweets() {
        allTweets = tweetService.fetchAllTweets()
    }
    
    func fetchUserTweets(user: User) {
        userTweets = tweetService.fetchTweetsByUser(user: user)
    }
}
