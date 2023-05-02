//
//  TweetView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct TweetView: View {
    
    @State private var isLiked: Bool = false
    @State private var isRetweeted: Bool = false
    @State private var showTweetDetail: Bool = false
    @State private var showAuthorProfile: Bool = false
    //@Binding var showProfile: Bool
    
    var tweet: Tweet
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            
//            Image(tweet.author.profilePhoto ?? "default")
//                .resizable()
//                .scaledToFill()
//                .clipShape(Circle())
//                .frame(width: 38, height: 38)
            TweetProfilePhotoButtonView(user: tweet.author, showAuthorProfile: $showAuthorProfile)
            
            VStack(alignment: .leading, spacing: 8) {
                
                HStack {
                    Text(tweet.author.displayName)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
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
                
                Text(tweet.text)
                    .onTapGesture {
                        showTweetDetail.toggle()
                    }
                
                HStack {
                    Button {
                        // comment pressed
                    } label: {
                        HStack {
                            Image(systemName: "bubble.left")
                            Text("0")
                        }
                    }

                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isRetweeted.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .fontWeight(isRetweeted ? .bold : .semibold)
                                .foregroundColor(isRetweeted ? Color.green : Color.theme.text.opacity(0.4))
                            Text("\(tweet.retweets)")
                        }
                    }

                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isLiked.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .foregroundColor(isLiked ? Color.red : Color.theme.text.opacity(0.4))
                            Text("\(tweet.likes)")
                        }
                    }

                    Spacer()
                    
                    HStack {
                        Image(systemName: "chart.bar")
                        Text("\(tweet.views)")
                    }
                    Spacer()
                    
                    Button {
                        // share pressed
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.theme.text.opacity(0.4))
                
            }
        }
        .foregroundColor(Color.theme.text)
        .padding(.top, 8)
        .preferredColorScheme(.dark)
        .fullScreenCover(isPresented: $showTweetDetail) {
            TweetDetailView(showTweetDetail: $showTweetDetail, tweet: tweet)
        }
        .fullScreenCover(isPresented: $showAuthorProfile) {
            ProfileView(showProfile: $showAuthorProfile, user: tweet.author)
        }
    }
    
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView(tweet: Tweet(author: User.doge, date: "1m", text: "This is a sample tweet", images: nil, likes: 585, retweets: 24, bookmarks: 7, views: 2525))
    }
}
