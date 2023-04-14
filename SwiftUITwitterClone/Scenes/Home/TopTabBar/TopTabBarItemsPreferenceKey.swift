//
//  TopTabBarItemsPreferenceKey.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import Foundation
import SwiftUI

// MARK: - TabBarItemsPreferenceKey

struct TopTabBarItemsPreferenceKey: PreferenceKey {
    
    static var defaultValue: [TopTabBarItem] = []
    
    static func reduce(value: inout [TopTabBarItem], nextValue: () -> [TopTabBarItem]) {
        // append new value (tab) to preference key so array keeps growing
        value += nextValue()
    }
}

// MARK: - TabBarItemViewModifier

// View Modifier
// With this, we dont have to directly call our preference key everytime
// handles the tab's opacity based on if its selected, as well as the
// preference that that tab is associated with
struct TopTabBarItemViewModifier: ViewModifier {
    // the TabBarItem enum case that is being created
    let tab: TopTabBarItem
    // the currently selected enum case
    @Binding var selection: TopTabBarItem
    
    // handle changing opacity and updating preference key
    func body(content: Content) -> some View {
        
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: TopTabBarItemsPreferenceKey.self, value: [tab])
    }
}

// MARK: - View Extension

// extension of View to call the view modifier
// call it in the view to add in a tab, the modifier
// will call the view modifier, which will update the preference key
extension View {
    // tab: the TabBarItem enum case being created
    // selection: the currently selected TabBarItem enum case
    func topTabBarItem(tab: TopTabBarItem, selection: Binding<TopTabBarItem>) -> some View {
        
        modifier(TopTabBarItemViewModifier(tab: tab, selection: selection))
    }
}
