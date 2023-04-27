//
//  CustomTabBarContainerView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

// Container for the tab bar view and the content
// Puts any kind of view underneath the tab bar view
struct BottomTabBarContainerView<Content: View>: View {
    // TabBarItem enum case that is currently selected (highlighted)
    @Binding var selection: BottomTabBarItem
    
    // All content created within the closure (they have the .tabBarItem modifiers)
    // in this case, just the background colors
    let content: Content
    
    // set to empty array - tabview doesnt have any items until .tabItem is called
    // on one of its child views. trying to replicate that
    @State private var tabs: [BottomTabBarItem] = []
    
    public init(selection: Binding<BottomTabBarItem>, @ViewBuilder content: () -> Content) {
        // _ because we're referencing the actual binding/raw value of selection
        self._selection = selection
        // call the closure to get content
        self.content = content()
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            Color.theme.background
                .ignoresSafeArea()
            
            // make background color cover entire screen
            content
                .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
            
            // Tab bar at the bottom
            // tabs : the array of tabs
            // selection : selection bound to this view to handle content animation
            // localSelection : selection used in the tab bar to animate changing tabs
            BottomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
        // watch the preference key
        // update the array of tabs when one is added to the preference key
        .onPreferenceChange(BottomTabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct BottomTabBarContainerView_Previews: PreviewProvider {
    static let tabs: [BottomTabBarItem] = [
        .home, .search, .spaces, .notifications, .messages
    ]
    static var previews: some View {
        BottomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
