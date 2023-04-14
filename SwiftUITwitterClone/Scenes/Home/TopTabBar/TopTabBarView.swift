//
//  TopTabBarView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct TopTabBarView: View {

    let tabs: [TopTabBarItem]
    @Binding var selection: TopTabBarItem
    @Namespace private var namespaceTop
    @State var localSelection: TopTabBarItem
    
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

struct TopTabBarView_Previews: PreviewProvider {

    static let tabs: [TopTabBarItem] = [
        .forYou, .following
    ]
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                
                TopTabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
                
                Spacer()
            }
        }
    }
}

// MARK: - Extension

extension TopTabBarView {
    
    // individual tab item
    private func tabView(tab: TopTabBarItem) -> some View {
        
        VStack {
            Text(tab.title)
                .padding(.bottom)
                .background(
                    ZStack(alignment: .bottom) {
                        if localSelection == tab {
                            RoundedRectangle(cornerRadius: 4)
                                .frame(height: 4)
                                .offset(y: 8)
                                .matchedGeometryEffect(id: "background_rectangle", in: namespaceTop)
                        }
                    }
                )
        }
        .font(.title3)
        .fontWeight(localSelection == tab ? .semibold : .regular)
        .foregroundColor(localSelection == tab ? Color.white.opacity(0.6) : Color.white.opacity(0.4))
    }
    
    private var tabBar: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                Spacer()
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
                Spacer()
            }
        }
        .background(Color.black)
    }
    
    // make tapped tab the selected tab
    private func switchToTab(tab: TopTabBarItem) {
        // between animate screens
         withAnimation(.easeInOut) {
         selection = tab
         }
        //selection = tab
    }
}
