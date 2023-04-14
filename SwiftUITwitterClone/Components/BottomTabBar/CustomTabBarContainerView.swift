//
//  CustomTabBarContainerView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

// Container for the tab bar view and the content
// Puts any kind of view underneath the tab bar view
struct CustomTabBarContainerView<Content: View>: View {
    // TabBarItem enum case that is currently selected (highlighted)
    @Binding var selection: TabBarItem
    
    // All content created within the closure (they have the .tabBarItem modifiers)
    // in this case, just the background colors
    let content: Content
    
    // set to empty array - tabview doesnt have any items until .tabItem is called
    // on one of its child views. trying to replicate that
    @State private var tabs: [TabBarItem] = []
    
    public init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        // _ because we're referencing the actual binding/raw value of selection
        self._selection = selection
        // call the closure to get content
        self.content = content()
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            // make background color cover entire screen
            content
                .ignoresSafeArea()
            
            // Tab bar at the bottom
            // tabs : the array of tabs
            // selection : selection bound to this view to handle content animation
            // localSelection : selection used in the tab bar to animate changing tabs
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
        // watch the preference key
        // update the array of tabs when one is added to the preference key
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        .home, .search, .spaces, .notifications, .messages
    ]
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
