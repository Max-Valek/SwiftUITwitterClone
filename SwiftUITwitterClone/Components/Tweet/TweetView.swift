//
//  TweetView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct TweetView: View {
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 40, height: 40)
            
            VStack {
                
                HStack {
                    Text("User")
                        .font(.title2)
                    
                    Text("@user")
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                    Text("1m")
                    
                    Text("•••")
                }
            }
        }
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView()
    }
}
