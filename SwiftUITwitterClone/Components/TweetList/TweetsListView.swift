//
//  TweetsListView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import SwiftUI

struct TweetsListView: View {
    
    var tweets: [Tweet]
    @ObservedObject var vm: MainViewModel
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            ForEach(tweets) { tweet in
                TweetView(vm: vm, tweet: tweet)
                HorizontalLine()
            }
        }
        .padding(.horizontal, 4)
    }
}

struct TweetsListView_Previews: PreviewProvider {
    static var previews: some View {
        TweetsListView(tweets: Tweet.forYouTweets, vm: MainViewModel())
            .preferredColorScheme(.dark)
    }
}
