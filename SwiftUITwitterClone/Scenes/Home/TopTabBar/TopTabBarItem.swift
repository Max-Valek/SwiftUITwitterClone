//
//  TopTabBarItem.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import Foundation

enum TopTabBarItem: Hashable {
    case forYou, following
    
    var title: String {
        switch self {
        case .forYou:
            return "For You"
        case .following:
            return "Following"
        }
    }
}
