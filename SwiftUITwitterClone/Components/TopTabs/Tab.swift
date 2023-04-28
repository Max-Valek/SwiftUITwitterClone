//
//  Tab.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/28/23.
//

import SwiftUI

// Tab Model
struct Tab: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    // animation properties
    var width: CGFloat = 0
    var minX: CGFloat = 0
    // for demo
    var color: Color
}

// Sample Tabs
var profileTabs_: [Tab] = [
    .init(title: "Tweets", color: Color.theme.text.opacity(0.2)),
    .init(title: "Replies", color: Color.theme.twitter.opacity(0.2)),
    .init(title: "Media", color: Color.theme.twitterLight.opacity(0.2)),
    .init(title: "Likes", color: Color.theme.twitterDark.opacity(0.2))
]
