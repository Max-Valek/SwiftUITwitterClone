//
//  Tweet.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import SwiftUI

struct Tweet: Identifiable {
    var id = UUID()
    let date: String
    let text: String
    let images: [Image]?
    var likes: Int
    var retweets: Int
}
