//
//  TabBarItem.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import Foundation
import SwiftUI

// model for customizing item in tab bar
// hashable so it can be used in for each (with id: \.self)
//struct TabBarItem: Hashable {
//
//    let iconName: String
//    let title: String
//    let color: Color
//}


// MARK: - TabBarItem

// make it an enum since we already have all the data
// use a model (struct) when you dont know what the data it.
// if you have the data up front, use an enum
enum BottomTabBarItem: Hashable {
    case home, search, spaces, notifications, messages
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .spaces:
            return "mic"
        case .notifications:
            return "bell"
        case .messages:
            return "envelope"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .spaces:
            return "Spaces"
        case .notifications:
            return "Notif"
        case .messages:
            return "Messages"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return Color.black
        case .search:
            return Color.mint
        case .spaces:
            return Color.purple
        case .notifications:
            return Color.gray
        case .messages:
            return Color.blue
        }
    }
}
