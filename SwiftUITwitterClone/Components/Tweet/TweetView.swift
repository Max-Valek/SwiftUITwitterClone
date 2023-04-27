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
            
            VStack(alignment: .leading, spacing: 8) {
                
                HStack {
                    Text("User")
                        .font(.title3)
                    
                    Text("@user • 1m")
                        .font(.title3)
                        .foregroundColor(Color.theme.text.opacity(0.4))
                    
                    Spacer()
                    
                    Text("•••")
                        .foregroundColor(Color.theme.text.opacity(0.4))
                }
                
                Text("This is a sample tweet. It is not very pretty and this is just sample text.")
                
                HStack {
                    HStack {
                        Image(systemName: "bubble.left")
                        Text("82")
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "arrow.triangle.2.circlepath")
                        Text("71")
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "heart")
                        Text("1,538")
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "chart.bar")
                        Text("182K")
                    }
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.theme.text.opacity(0.4))
                
            }
        }
        .foregroundColor(Color.theme.text)
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView()
    }
}
