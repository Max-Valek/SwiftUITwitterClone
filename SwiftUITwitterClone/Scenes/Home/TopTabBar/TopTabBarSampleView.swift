//
//  TopTabBarSampleView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct TopTabBarSampleView: View {
    
    @State private var tabSelection: TopTabBarItem = TopTabBarItem.forYou
    
    var body: some View {
        
        // our custom implementation of TabView
        TopTabBarContainerView(selection: $tabSelection) {
            // ViewBuilder
            // For You, Following
            
            Color.black
                // add TabBarItem to TabBarItemsPreferenceKey array
                .topTabBarItem(tab: TopTabBarItem.forYou, selection: $tabSelection)
            
            Color.white
                .topTabBarItem(tab: TopTabBarItem.following, selection: $tabSelection)
            
        }
        
    }
}

struct TopTabBarSampleView_Previews: PreviewProvider {
    static var previews: some View {
        TopTabBarSampleView()
    }
}
