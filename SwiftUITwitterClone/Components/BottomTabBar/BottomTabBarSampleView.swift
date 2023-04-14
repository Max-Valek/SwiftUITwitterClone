//
//  TabBarSampleView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct BottomTabBarSampleView: View {
    
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
            
            
            Color.black
                // add TabBarItem to TabBarItemsPreferenceKey array
                .bottomTabBarItem(tab: BottomTabBarItem.home, selection: $tabSelection)
            
            Color.white
                .bottomTabBarItem(tab: BottomTabBarItem.search, selection: $tabSelection)
            
            Color.purple
                .bottomTabBarItem(tab: BottomTabBarItem.spaces, selection: $tabSelection)
            
            Color.gray
                .bottomTabBarItem(tab: BottomTabBarItem.notifications, selection: $tabSelection)
            
            Color.blue
                .bottomTabBarItem(tab: BottomTabBarItem.messages, selection: $tabSelection)
        }
        
    }
}

struct BottomTabBarSampleView_Previews: PreviewProvider {
    
    static var previews: some View {
        BottomTabBarSampleView()
    }
}

// MARK: - AppTabBarView (Example of Apple's TabView)

extension BottomTabBarSampleView {
    
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
