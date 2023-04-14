//
//  CustomNavBarContainerView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

/*
 
 Container for our custom nav bar and our screen
 
 */
struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    // items for nav bar
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var subtitle: String? = nil
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            CustomNavBarView(showBackButton: showBackButton, title: title, subtitle: subtitle)
            
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        // watch/listen to preference keys
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self) { value in
            self.title = value
        }
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self) { value in
            self.subtitle = value
        }
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self) { value in
            self.showBackButton = !value
        }
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        
        CustomNavBarContainerView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                Text("Hello, World!")
                    .foregroundColor(.white)
                    .customNavigationTitle("new title")
                    .customNavigationSubtitle("subtitle")
                    .customNavigationBarBackButtonHidden(true)
            }
        }
    }
}
