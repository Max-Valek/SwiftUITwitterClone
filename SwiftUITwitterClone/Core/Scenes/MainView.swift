//
//  MainView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct MainView: View {
    
    // selection for content (used in CustomTabBarContainerView)
    @State private var selection: String = "home"
    
    @State private var tabSelection: BottomTabBarItem = BottomTabBarItem.home
    
    
    var body: some View {
        // TabView from Apple
        // defaultTabView
        
        // our custom implementation of TabView
        BottomTabBarContainerView(selection: $tabSelection) {
            // ViewBuilder
            
            // home, search, spaces, notifications, messages
            
            HomeView()
            //Color.black
                // add TabBarItem to TabBarItemsPreferenceKey array
                .bottomTabBarItem(tab: BottomTabBarItem.home, selection: $tabSelection)
            
            SearchView()
                .bottomTabBarItem(tab: BottomTabBarItem.search, selection: $tabSelection)
            
            SpacesView()
                .bottomTabBarItem(tab: BottomTabBarItem.spaces, selection: $tabSelection)
            
            NotificationsView()
                .bottomTabBarItem(tab: BottomTabBarItem.notifications, selection: $tabSelection)
            
            MessagesView()
                .bottomTabBarItem(tab: BottomTabBarItem.messages, selection: $tabSelection)
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
