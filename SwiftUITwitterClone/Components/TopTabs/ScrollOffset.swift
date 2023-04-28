//
//  ScrollOffset.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/28/23.
//

import SwiftUI

/*
 this code defines a new modifier that allows developers to get the scroll offset of a view by
 providing a closure that's called whenever the scroll offset changes. The OffsetKey preference
 key is used to store and pass the scroll offset value between views.
 */

// TabView Content Scroll Offset
extension View {
    
    @ViewBuilder
    func offsetX(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader { proxy in
                    let rect = proxy.frame(in: .global)
                    
                    Color.clear
                        .preference(key: OffsetKey.self, value: rect)
                        .onPreferenceChange(OffsetKey.self, perform: completion)
                }
            }
    }
}

// Preference Key
struct OffsetKey: PreferenceKey {
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}



