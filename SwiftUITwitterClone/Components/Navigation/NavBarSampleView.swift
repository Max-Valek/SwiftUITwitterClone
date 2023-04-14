//
//  NavBarSampleView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct AppNavBarView: View {
    
    var body: some View {
        // default nav view from apple
        // defaultNavView
        
        // custom nav view
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                CustomNavLink(destination:
                                Text("Destination")
                                .customNavigationTitle("Second Screen")
                                .customNavigationSubtitle("Second Screen Subtitle")
                ) {
                    Text("Navigate")
                }
            }
            // .customNavigationTitle("Custom Title")
            // .customNavigationBarBackButtonHidden(true)
            // can call this instead of doing all individually
            .customNavBarItems(title: "Custom Title", subtitle: "Custom Subtitle", backButtonHidden: true)
        }
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}

extension AppNavBarView {
    
    // Default Apple Nav View
    private var defaultNavView: some View {
        NavigationView {
            
            ZStack {
                
                Color.green.ignoresSafeArea()
                
                NavigationLink {
                    Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                } label: {
                    Text("Navigate")
                }

            }
            .navigationTitle("Nav Title Here")
        }
    }
}
