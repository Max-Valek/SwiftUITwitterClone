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
    @StateObject private var vm = MainViewModel()
    
    var body: some View {
        // our custom implementation of TabView
        BottomTabBarContainerView(selection: $tabSelection) {
            HomeView(vm: vm)
                .bottomTabBarItem(tab: BottomTabBarItem.home, selection: $tabSelection)
            
            SearchView(vm: vm)
                .bottomTabBarItem(tab: BottomTabBarItem.search, selection: $tabSelection)
            
            SpacesView(vm: vm)
                .bottomTabBarItem(tab: BottomTabBarItem.spaces, selection: $tabSelection)
            
            NotificationsView(vm: vm)
                .bottomTabBarItem(tab: BottomTabBarItem.notifications, selection: $tabSelection)
            
            MessagesView(vm: vm)
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
