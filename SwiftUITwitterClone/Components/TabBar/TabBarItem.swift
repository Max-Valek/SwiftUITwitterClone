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
enum TabBarItem: Hashable {
    case home, favorites, profile, messages
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .favorites:
            return "heart"
        case .profile:
            return "person"
        case .messages:
            return "message"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .favorites:
            return "Favorites"
        case .profile:
            return "Profile"
        case .messages:
            return "Messages"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return Color.red
        case .favorites:
            return Color.blue
        case .profile:
            return Color.green
        case .messages:
            return Color.orange
        }
    }
}
