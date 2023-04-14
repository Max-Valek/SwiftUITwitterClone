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
            
            Color.black
                .tabBarItem(tab: TabBarItem.search, selection: $tabSelection)
            
            Color.black
                .tabBarItem(tab: TabBarItem.spaces, selection: $tabSelection)
            
            Color.black
                .tabBarItem(tab: TabBarItem.notifications, selection: $tabSelection)
            
            Color.black
                .tabBarItem(tab: TabBarItem.messages, selection: $tabSelection)
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
