//
//  TweetDetailView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import SwiftUI

struct TweetDetailView: View {
    
    @Binding var showTweetDetail: Bool
    var tweet: Tweet
    
    var body: some View {
        
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                topItems
                VStack {
                    HStack(alignment: .top, spacing: 16) {
                        VStack(alignment: .leading, spacing: 8) {
                            tweetAuthor
                            tweetText
                            dateAndViews
                            HorizontalLine()
                            tweetStats
                            HorizontalLine()
                            buttonRow
                            HorizontalLine()
                        }
                    }
                    .padding()
                }
                Spacer()
            }
        }
        .preferredColorScheme(.dark)
        
    }
}

struct TweetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TweetDetailView(showTweetDetail: .constant(true),
                        tweet: Tweet(author: User.doge, date: "1m", text: "This is a sample tweet", images: nil, likes: 585, retweets: 24, bookmarks: 7, views: 2525))
    }
}

extension TweetDetailView {
    // back button and title
    private var topItems: some View {
        VStack {
            HStack {
                
                Button {
                    showTweetDetail.toggle()
                } label: {
                    Image(systemName: "arrow.left")
                }
                
                Spacer()
                
                Text("Tweet")
                    .font(.headline)
                
                Spacer()
                
                Image(systemName: "arrow.left")
                    .opacity(0)
                
            }
            .padding(.horizontal)
            HorizontalLine()
        }
    }
    // user image, display name, username, timestamp, action button
    private var tweetAuthor: some View {
        HStack {
            Image(tweet.author.profilePhoto ?? "default")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 30, height: 30)
            
            Text(tweet.author.displayName)
                .font(.title3)
            
            HStack {
                Text("@\(tweet.author.username)")
                Text("• 1m")
            }
            .font(.headline)
            .foregroundColor(Color.theme.text.opacity(0.4))
            
            Spacer()
            
            Text("•••")
                .foregroundColor(Color.theme.text.opacity(0.4))
        }
    }
    // tweet text
    private var tweetText: some View {
        Text(tweet.text)
            .onTapGesture {
                showTweetDetail.toggle()
            }
    }
    // time, date, views
    private var dateAndViews: some View {
        HStack(spacing: 4) {
            Text("12:00 PM • 5/1/23 •")
            Text("\(tweet.views)")
                .foregroundColor(Color.theme.text)
                .fontWeight(.bold)
            Text("Views")
        }
        .padding(.top)
        .font(.caption)
        .foregroundColor(Color.theme.text.opacity(0.5))
    }
    // retweets, quotes, likes, bookmarks
    private var tweetStats: some View {
        HStack(spacing: 4) {
            Text("\(tweet.retweets)")
                .foregroundColor(Color.theme.text)
                .fontWeight(.bold)
            Text("Retweets")
            Text("0")
                .foregroundColor(Color.theme.text)
                .fontWeight(.bold)
            Text("Quotes")
            Text("\(tweet.likes)")
                .foregroundColor(Color.theme.text)
                .fontWeight(.bold)
            Text("Likes")
            Text("\(tweet.bookmarks)")
                .foregroundColor(Color.theme.text)
                .fontWeight(.bold)
            Text("Bookmarks")
        }
        .font(.caption)
        .foregroundColor(Color.theme.text.opacity(0.5))
    }
    // comment, retweet, like, bookmark, share
    private var buttonRow: some View {
        HStack {
            Image(systemName: "bubble.left")
            Spacer()
            Image(systemName: "arrow.triangle.2.circlepath")
            Spacer()
            Image(systemName: "heart")
            Spacer()
            Image(systemName: "bookmark")
            Spacer()
            Image(systemName: "square.and.arrow.up")
        }
        .padding(.horizontal, 24)
        .font(.subheadline)
        .foregroundColor(Color.theme.text.opacity(0.5))
    }
}
