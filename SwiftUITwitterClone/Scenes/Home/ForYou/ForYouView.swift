//
//  ForYouView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct ForYouView: View {
    
    var body: some View {
        
        ScrollView {
            ForEach(0..<10, id: \.self) { num in
                TweetView()
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 0.5)
                    .foregroundColor(.gray)
            }
            .padding(.top, 50)
        }
    }
}

struct ForYouView_Previews: PreviewProvider {
    static var previews: some View {
        ForYouView()
    }
}
