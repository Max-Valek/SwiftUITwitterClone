//
//  TwitterTabBarView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct CustomTabBarView: View {
    // array of tabs, each with icon name, title, and color
    let tabs: [TabBarItem]
    // selection bound to main app view
    @Binding var selection: TabBarItem
    // for matched geometry effect
    @Namespace private var namespace
    // selection used in this file to animate the tab bar
    // without animating the content
    @State var localSelection: TabBarItem
    
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

struct CustomTabBarView_Previews: PreviewProvider {

    static let tabs: [TabBarItem] = [
        .home, .search, .spaces, .notifications, .messages
    ]
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}

// MARK: - Extension

extension CustomTabBarView {
    
    // individual tab item
    private func tabView(tab: TabBarItem) -> some View {
        
        VStack {
            Image(systemName: tab.iconName)
                .font(.title3)
        }
        .fontWeight(localSelection == tab ? .semibold : .regular)
        .foregroundColor(localSelection == tab ? Color.white.opacity(0.6) : Color.white.opacity(0.4))
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.white.opacity(0.05))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
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
        .background(Color.white.opacity(0.03).ignoresSafeArea(edges: .bottom))
        .cornerRadius(5)
        // .shadow(color: Color.white.opacity(0.4), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
    
    // make tapped tab the selected tab
    private func switchToTab(tab: TabBarItem) {
        // uncomment to between animate screens
        // withAnimation(.easeInOut) {
            // selection = tab
        // }
        selection = tab
    }
}
