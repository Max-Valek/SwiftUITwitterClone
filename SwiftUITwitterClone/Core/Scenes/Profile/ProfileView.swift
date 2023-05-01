//
//  ProfileView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/27/23.
//

import SwiftUI

enum ProfileTab: String, CaseIterable {
    case tweets = "Tweets"
    case replies = "Replies"
    case media = "Media"
    case likes = "Likes"
}

struct ProfileView: View {
    
    @State private var selectedTab: ProfileTab = .tweets
    
    @Namespace private var profileNamespace
    
    @Binding var showProfile: Bool
    
    let tweets: [Tweet] = Tweet.userTweets
    
    var body: some View {
        
        ZStack {
            
            Color.theme.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                headerAndButtons
                
                photoAndEditProfile
                
                nameAndUsername
                
                info
                
                tabs
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 0.5)
                    .foregroundColor(Color.theme.text.opacity(0.2))
                
                TweetsListView(tweets: tweets)
                    .padding(.horizontal, 8)
                
                Spacer()
            }
            .foregroundColor(Color.theme.text)
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showProfile: .constant(true))
            .preferredColorScheme(.dark)
    }
}

extension ProfileView {
    
    private var headerAndButtons: some View {
        VStack {
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(Color.theme.twitter)
                    // .frame(height: 140)
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Button {
                            showProfile.toggle()
                        } label: {
                            Image(systemName: "arrow.left")
                        }
                        
                        Spacer()
                        
                        Image(systemName: "magnifyingglass")
                    }
                    .padding()
                }
            }
            
        }
        .frame(height: 80)
    }
    
    private var photoAndEditProfile: some View {
        HStack(alignment: .center) {
            Image("doge")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 75, height: 75)
                .padding(1)
                .background(Color.white, in: Circle())
                .offset(y: -20)
                
            Spacer()
            
            Button {
                // edit profile pressed
            } label: {
                Text("Edit profile")
                    .font(.subheadline)
                    .padding(4)
                    .padding(.horizontal, 4)
                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color.theme.text.opacity(0.4), lineWidth: 1))
                
            }
            .offset(y: -16)
        }
        .padding(.horizontal)
    }
    
    private var nameAndUsername: some View {
        HStack {
            
            VStack(alignment: .leading) {
                Text("Doge")
                    .font(.title2)
                    .fontWeight(.black)
                Text("@doge")
                    .font(.headline)
                    .foregroundColor(Color.theme.text.opacity(0.5))
            }
            
            Spacer()
        }
        .padding(.horizontal, 25)
        .padding(.bottom, -10)
        .offset(y: -16)
    }
    
    private var info: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 16) {
                HStack(spacing: 2) {
                    Image(systemName: "location.north.circle")
                    Text("Location")
                }
                
                HStack(spacing: 2) {
                    Image(systemName: "calendar")
                    Text("Joined April 2023")
                }
                Spacer()
            }
            .font(.subheadline)
            .foregroundColor(Color.theme.text.opacity(0.65))
            
            HStack(spacing: 16) {
                HStack(alignment: .bottom, spacing: 4) {
                    Text("100")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Following")
                        .font(.subheadline)
                        .foregroundColor(Color.theme.text.opacity(0.65))
                }
                HStack(alignment: .bottom, spacing: 4) {
                    Text("100")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Followers")
                        .font(.subheadline)
                        .foregroundColor(Color.theme.text.opacity(0.65))
                }
            }
            
        }
        .padding(.horizontal, 25)
    }
    
    private var tabs: some View {
        HStack {
            
            Spacer()
            
            ForEach(ProfileTab.allCases, id: \.self) { tab in
                VStack {
                    Text(tab.rawValue)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(selectedTab == tab ? Color.theme.text : Color.theme.text.opacity(0.4))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.25)) {
                                selectedTab = tab
                            }
                        }
                    
                    // tab underline
                    if selectedTab == tab {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 3)
                            .foregroundColor(Color.theme.twitter)
                            .matchedGeometryEffect(id: "tab_underline", in: profileNamespace)
                    } else {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 3)
                            .foregroundColor(.clear)
                    }
                }
                Spacer()
            }
        }
        .padding(.top)
    }
}
