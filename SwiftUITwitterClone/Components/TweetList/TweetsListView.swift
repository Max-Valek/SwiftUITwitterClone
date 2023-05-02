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
    //@Binding var showProfile: Bool
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            ForEach(tweets) { tweet in
                TweetView(vm: vm, tweet: tweet)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 0.5)
                    .foregroundColor(Color.theme.text.opacity(0.2))
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
