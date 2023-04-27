//
//  TwitterTabBarView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct BottomTabBarView: View {
    // array of tabs, each with icon name, title, and color
    let tabs: [BottomTabBarItem]
    // selection bound to main app view
    @Binding var selection: BottomTabBarItem
    // for matched geometry effect
    @Namespace private var namespace
    // selection used in this file to animate the tab bar
    // without animating the content
    @State var localSelection: BottomTabBarItem
    
    var body: some View {
        
        tabBar
            // only animate tab bar when selection changes
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

struct BottomTabBarView_Previews: PreviewProvider {

    static let tabs: [BottomTabBarItem] = [
        .home, .search, .spaces, .notifications, .messages
    ]
    static var previews: some View {
        VStack {
            Spacer()
            BottomTabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}

// MARK: - Extension

extension BottomTabBarView {
    
    // individual tab item
    private func tabView(tab: BottomTabBarItem) -> some View {
        
        VStack {
            Image(systemName: tab.iconName)
                .font(.title2)
        }
        .fontWeight(localSelection == tab ? .bold : .semibold)
        .foregroundColor(localSelection == tab ? Color.theme.text.opacity(0.8) : Color.theme.text.opacity(0.6))
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
    }
    
    private var tabBar: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.theme.background.opacity(0.95).ignoresSafeArea(edges: .bottom))
        .cornerRadius(5)
        .padding(.horizontal)
    }
    
    // make tapped tab the selected tab
    private func switchToTab(tab: BottomTabBarItem) {
        selection = tab
    }
}
