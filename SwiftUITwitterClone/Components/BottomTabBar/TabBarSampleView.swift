//
//  TabBarSampleView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct AppTabBarView: View {
    
    // selection for content (used in CustomTabBarContainerView)
    @State private var selection: String = "home"
    
    @State private var tabSelection: TabBarItem = TabBarItem.home
    
    var body: some View {
        // TabView from Apple
        // defaultTabView
        
        // our custom implementation of TabView
        CustomTabBarContainerView(selection: $tabSelection) {
            // ViewBuilder
            
            // home, search, spaces, notifications, messages
            
            
            Color.black
                // add TabBarItem to TabBarItemsPreferenceKey array
                .tabBarItem(tab: TabBarItem.home, selection: $tabSelection)
            
            Color.white
                .tabBarItem(tab: TabBarItem.search, selection: $tabSelection)
            
            Color.purple
                .tabBarItem(tab: TabBarItem.spaces, selection: $tabSelection)
            
            Color.gray
                .tabBarItem(tab: TabBarItem.notifications, selection: $tabSelection)
            
            Color.blue
                .tabBarItem(tab: TabBarItem.messages, selection: $tabSelection)
        }
        
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabBarView()
    }
}

// MARK: - AppTabBarView (Example of Apple's TabView)

extension AppTabBarView {
    
    private var defaultTabView: some View {
        // SwiftUI's TabView
        TabView(selection: $selection) {
            
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}
