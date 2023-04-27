//
//  HomeView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

enum HomeTab {
    case forYou, following
}

struct HomeView: View {
    
    @State private var selectedTab: HomeTab = .forYou
    @Namespace private var topTabsNamespace
    
    var body: some View {
        
        ZStack {
            
            Color.theme.background.ignoresSafeArea()
        
            VStack {
                
                VStack {
                    topImages
                    
                    topTabs
                }
                .background(Color.theme.background.opacity(0.95))
                
                content
                
                Spacer()
            }
            .padding(.horizontal)
            
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}

extension HomeView {
    
    private var topImages: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 35, height: 35)
            
            Spacer()
            
            Image("twitter")
                .resizable()
                .frame(width: 45, height: 45)
            
            Spacer()
            
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 35, height: 35)
                .opacity(0)
        }
    }
    
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
        .font(.title3)
    }
    
    private var content: some View {
        VStack {
            switch selectedTab {
            case .forYou:
                ForYouView()
                    .transition(.move(edge: .leading))
            case .following:
                FollowingView()
                    .transition(.move(edge: .trailing))
            }
        }
    }
}
