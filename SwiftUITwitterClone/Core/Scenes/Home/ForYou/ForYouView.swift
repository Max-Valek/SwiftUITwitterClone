//
//  ForYouView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct ForYouView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            ForEach(0..<10, id: \.self) { num in
                TweetView()
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 0.5)
                    .foregroundColor(Color.theme.text.opacity(0.4))
            }
        }
        .padding(.horizontal, 4)
    }
}

struct ForYouView_Previews: PreviewProvider {
    static var previews: some View {
        ForYouView()
    }
}
