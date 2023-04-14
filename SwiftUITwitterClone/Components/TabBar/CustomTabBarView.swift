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
        
        // tabBarVersion1
        
        tabBarVersion2
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
        .home, .favorites, .profile
    ]
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}

// MARK: - Version 1

extension CustomTabBarView {
    
    // view for an individual tab item
    private func tabView(tab: TabBarItem) -> some View {
        
        VStack {
            
            Image(systemName: tab.iconName)
                .font(.subheadline)
            
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? tab.color.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
    
    // view for all tab views
    private var tabBarVersion1: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
    
    // make tapped tab the selected tab
    private func switchToTab(tab: TabBarItem) {
        // uncomment to between screens
//        withAnimation(.easeInOut) {
//            selection = tab
//        }
        selection = tab
    }
}

// MARK: - Version 2

// animate w matched geometry effect
extension CustomTabBarView {
    
    // individual tab
    // returns a tab item view w/ an icon, title, and color
    private func tabView2(tab: TabBarItem) -> some View {
        
        VStack {
            
            Image(systemName: tab.iconName)
                .font(.subheadline)
            
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
    }
    
    private var tabBarVersion2: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}
