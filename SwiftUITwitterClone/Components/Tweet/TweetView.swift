//
//  TweetView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct TweetView: View {
    
    @State private var isLiked: Bool = false
    @State private var isRetweeted: Bool = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 38, height: 38)
            
            VStack(alignment: .leading, spacing: 8) {
                
                HStack {
                    Text("User")
                        .font(.title3)
                    
                    Text("@user • 1m")
                        .font(.headline)
                        .foregroundColor(Color.theme.text.opacity(0.4))
                    
                    Spacer()
                    
                    Text("•••")
                        .foregroundColor(Color.theme.text.opacity(0.4))
                }
                
                Text("This is a sample tweet. It is not very pretty and this is just sample text.")
                
                HStack {
                    Button {
                        // comment pressed
                    } label: {
                        HStack {
                            Image(systemName: "bubble.left")
                            Text("82")
                        }
                    }

                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isRetweeted.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .fontWeight(isRetweeted ? .bold : .semibold)
                                .foregroundColor(isRetweeted ? Color.green : Color.theme.text.opacity(0.4))
                            Text("71")
                        }
                    }

                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isLiked.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .foregroundColor(isLiked ? Color.red : Color.theme.text.opacity(0.4))
                            Text("1,538")
                        }
                    }

                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "chart.bar")
                        Text("182K")
                    }
                    Spacer()
                    
                    Button {
                        // share pressed
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
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
