//
//  TabBarItemsPreferenceKey.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import Foundation
import SwiftUI

// MARK: - TabBarItemsPreferenceKey

// Preference Key
// when a tab bar item is created with .tabBarItem, it gets added to the array in here
// dont have to directly call this preference key all the time because of our view modifier
struct BottomTabBarItemsPreferenceKey: PreferenceKey {
    
    static var defaultValue: [BottomTabBarItem] = []
    
    static func reduce(value: inout [BottomTabBarItem], nextValue: () -> [BottomTabBarItem]) {
        // append new value (tab) to preference key so array keeps growing
        value += nextValue()
    }
}

// MARK: - TabBarItemViewModifier

// View Modifier
// With this, we dont have to directly call our preference key everytime
// handles the tab's opacity based on if its selected, as well as the
// preference that that tab is associated with
struct BottomTabBarItemViewModifier: ViewModifier {
    // the TabBarItem enum case that is being created
    let tab: BottomTabBarItem
    // the currently selected enum case
    @Binding var selection: BottomTabBarItem
    
    // handle changing opacity and updating preference key
    func body(content: Content) -> some View {
        
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: BottomTabBarItemsPreferenceKey.self, value: [tab])
    }
}

// MARK: - View Extension

// extension of View to call the view modifier
// call it in the view to add in a tab, the modifier
// will call the view modifier, which will update the preference key
extension View {
    // tab: the TabBarItem enum case being created
    // selection: the currently selected TabBarItem enum case
    func bottomTabBarItem(tab: BottomTabBarItem, selection: Binding<BottomTabBarItem>) -> some View {
        
        modifier(BottomTabBarItemViewModifier(tab: tab, selection: selection))
    }
}
