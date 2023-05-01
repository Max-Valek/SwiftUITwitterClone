//
//  ForYouView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct ForYouView: View {
    
    let tweets: [Tweet] = Tweet.forYouTweets
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            ForEach(tweets) { tweet in
                TweetView(tweet: tweet)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 0.5)
                    .foregroundColor(Color.theme.text.opacity(0.2))
            }
        }
        .padding(.horizontal, 4)
    }
}

struct ForYouView_Previews: PreviewProvider {
    static var previews: some View {
        ForYouView()
            .preferredColorScheme(.dark)
    }
}
