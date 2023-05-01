//
//  TweetDetailView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import SwiftUI

struct TweetDetailView: View {
    
    @Binding var showTweetDetail: Bool
    
    let tweet: Tweet
    
    var body: some View {
        
        ZStack {
            
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                
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
                    
                    RoundedRectangle(cornerRadius: 5)
                        .frame(height: 0.5)
                        .foregroundColor(Color.theme.text.opacity(0.2))
                }
                
                VStack {
                    
                    HStack(alignment: .top, spacing: 16) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            HStack {
                                Image("doge")
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 30, height: 30)
                                
                                Text("Doge")
                                    .font(.title3)
                                
                                Text("@doge • 1m")
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
                            
                            RoundedRectangle(cornerRadius: 5)
                                .frame(height: 0.5)
                                .foregroundColor(Color.theme.text.opacity(0.2))
                            
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
                            
                            RoundedRectangle(cornerRadius: 5)
                                .frame(height: 0.5)
                                .foregroundColor(Color.theme.text.opacity(0.2))
                            
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
                            
                            RoundedRectangle(cornerRadius: 5)
                                .frame(height: 0.5)
                                .foregroundColor(Color.theme.text.opacity(0.2))
                            
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
                        tweet: Tweet(date: "1m", text: "This is a sample tweet", images: nil, likes: 585, retweets: 24, bookmarks: 7, views: 2525))
    }
}
