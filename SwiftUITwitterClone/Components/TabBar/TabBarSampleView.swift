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
            
            Color.red
                // add TabBarItem to TabBarItemsPreferenceKey array
                .tabBarItem(tab: TabBarItem.home, selection: $tabSelection)
            
            Color.blue
                .tabBarItem(tab: TabBarItem.favorites, selection: $tabSelection)
            
            Color.green
                .tabBarItem(tab: TabBarItem.profile, selection: $tabSelection)
            
            Color.orange
                .tabBarItem(tab: .messages, selection: $tabSelection)
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
