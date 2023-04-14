//
//  TopTabBarContainerView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct TopTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TopTabBarItem
    let content: Content
    @State private var tabs: [TopTabBarItem] = []
    
    public init(selection: Binding<TopTabBarItem>, @ViewBuilder content: () -> Content) {
        
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            // make background color cover entire screen
            content
                .ignoresSafeArea()
            
            TopTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
        // watch the preference key
        // update the array of tabs when one is added to the preference key
        .onPreferenceChange(TopTabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct TopTabBarContainerView_Previews: PreviewProvider {
    static let tabs: [TopTabBarItem] = [
        .forYou, .following
    ]
    static var previews: some View {
        TopTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
            
            VStack {
                Text("Hello")
            }
        }
    }
}
