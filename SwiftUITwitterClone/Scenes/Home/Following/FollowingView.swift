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
                TweetView()
                    .foregroundColor(.blue)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 0.5)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal, 4)
    }
}

struct FollowingView_Previews: PreviewProvider {
    static var previews: some View {
        FollowingView()
    }
}
