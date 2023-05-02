//
//  HomeView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

// simple enum for keeping track of tab
enum HomeTab {
    case forYou, following
}

struct HomeView: View {
    
    @State private var selectedTab: HomeTab = .forYou
    @Namespace private var topTabsNamespace
    @ObservedObject var vm: MainViewModel
    
    var body: some View {
        ZStack {
            newTweetButton
            Color.theme.background.ignoresSafeArea()
            VStack {
                VStack {
                    topImages
                    topTabs
                    RoundedRectangle(cornerRadius: 5)
                        .frame(height: 0.5)
                        .foregroundColor(Color.theme.text.opacity(0.2))
                }
                .background(Color.theme.background.opacity(0.95))
                
                content
                Spacer()
            }
            .padding(.horizontal)
            // show loggedInUser's profile if show user is true
            .fullScreenCover(isPresented: $vm.showProfile) {
                ProfileView(vm: vm, user: vm.loggedInUser)
                    .preferredColorScheme(.dark)
            }
            // show selected user's profile
            .fullScreenCover(isPresented: $vm.showTweetAuthorProfile) {
                if let user = vm.selectedUser {
                    ProfileView(vm: vm, user: user)
                        .preferredColorScheme(.dark)
                }
            }
            // show new tweet view
            .fullScreenCover(isPresented: $vm.showNewTweetView) {
                NewTweetView(showNewTweetView: $vm.showNewTweetView)
            }
            
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: MainViewModel())
            .preferredColorScheme(.dark)
    }
}

extension HomeView {
    // logged in user photo button and twitter logo
    private var topImages: some View {
        HStack {
            // logged in user image button
            ProfilePhotoButtonView(vm: vm)
            Spacer()
            Image("twitter")
                .resizable()
                .frame(width: 40, height: 40)
            Spacer()
            // just for formatting
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .opacity(0)
        }
    }
    // for you and following tabs
    private var topTabs: some View {
        HStack {
            Spacer()
            VStack {
                Text("For You")
                    .foregroundColor(selectedTab == .forYou ? Color.theme.text : Color.theme.text.opacity(0.4))
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.25)) {
                            selectedTab = .forYou
                        }
                    }
                // tab underline
                if selectedTab == .forYou {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 50, height: 3)
                        .foregroundColor(Color.theme.twitter)
                        .matchedGeometryEffect(id: "tab_underline", in: topTabsNamespace)
                } else {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 50, height: 3)
                        .foregroundColor(.clear)
                }
            }
            Spacer()
            VStack {
                Text("Following")
                    .foregroundColor(selectedTab == .following ? Color.theme.text : Color.theme.text.opacity(0.4))
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.25)) {
                            selectedTab = .following
                        }
                }
                // tab underline
                if selectedTab == .following {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 50, height: 3)
                        .foregroundColor(Color.theme.twitter)
                        .matchedGeometryEffect(id: "tab_underline", in: topTabsNamespace)
                } else {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 50, height: 3)
                        .foregroundColor(.clear)
                }
            }
            Spacer()
        }
        .fontWeight(.semibold)
        .font(.headline)
    }
    // tweet list view depending on current tab
    private var content: some View {
        VStack {
            switch selectedTab {
            case .forYou:
                TweetsListView(tweets: Tweet.forYouTweets, vm: vm)
                    .transition(.move(edge: .leading))
                
            case .following:
                TweetsListView(tweets: Tweet.followingTweets, vm: vm)
                    .transition(.move(edge: .trailing))
            }
        }
    }
    // plus button
    private var newTweetButton: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        vm.showNewTweetView.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(Color.theme.text)
                        .padding()
                        .background(Color.theme.twitter, in: Circle())
                    }
                }
            }
        }
        .padding(.bottom, 85)
        .padding(.trailing)
        .zIndex(2)
    }
}
