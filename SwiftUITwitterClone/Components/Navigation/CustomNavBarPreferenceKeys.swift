//
//  CustomNavBarPreferenceKeys.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import Foundation
import SwiftUI

// Variables in CustomNavBarView:
//@State private var showBackButton: Bool = true
//@State private var title: String = "Title"
//@State private var subtitle: String? = "Subtitle"

// title
struct CustomNavBarTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

// subtitle
struct CustomNavBarSubtitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}

// showBackButton
struct CustomNavBarBackButtonHiddenPreferenceKey: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

// view extension so we can use them easily
extension View {
    // Apple's implementation
    // .navigationTitle("title 2")
    // .navigationBarBackButtonHidden(false)
    
    // title (works just like .navigationTitle)
    func customNavigationTitle(_ title: String) -> some View {
        preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
    }
    
    // subtitle
    func customNavigationSubtitle(_ subtitle: String?) -> some View {
        preference(key: CustomNavBarSubtitlePreferenceKey.self, value: subtitle)
    }
    
    // showing back button
    func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View {
        preference(key: CustomNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    // combining the 3 above into one
    // dont always want to set all of them, give them default values
    func customNavBarItems(title: String = "", subtitle: String? = nil, backButtonHidden: Bool = false) -> some View {
        self
            .customNavigationTitle(title)
            .customNavigationSubtitle(subtitle)
            .customNavigationBarBackButtonHidden(backButtonHidden)
    }
}
