//
//  HomeView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var tabSelection: TopTabBarItem = TopTabBarItem.forYou
    
    var body: some View {
        
        ZStack {
            
            Color.black.ignoresSafeArea()
        
            VStack {
                
                topImages
                
                TopTabBarContainerView(selection: $tabSelection) {
                    
                    ForYouView()
                    // add TabBarItem to TabBarItemsPreferenceKey array
                        .topTabBarItem(tab: TopTabBarItem.forYou, selection: $tabSelection)
                    
                    FollowingView()
                        .topTabBarItem(tab: TopTabBarItem.following, selection: $tabSelection)
                    
                }
                
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
                .frame(width: 30, height: 30)
                .opacity(0)
        }
    }
}
