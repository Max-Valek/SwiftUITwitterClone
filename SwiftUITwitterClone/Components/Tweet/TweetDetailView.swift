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
                
                HStack(alignment: .top, spacing: 16) {
                    
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 38, height: 38)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        HStack {
                            Text("User")
                                .font(.title3)
                            
                            Text("@user • 1m")
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
                    }
                }
                .padding()
                
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
