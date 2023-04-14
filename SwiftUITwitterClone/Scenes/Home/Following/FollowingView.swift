//
//  FollowingView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct FollowingView: View {
    
    var body: some View {
        
        ScrollView {
            ForEach(0..<10, id: \.self) { num in
                Text("\(num)")
            }
        }
    }
}

struct FollowingView_Previews: PreviewProvider {
    static var previews: some View {
        FollowingView()
    }
}