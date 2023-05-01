//
//  NewTweetView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import SwiftUI

struct NewTweetView: View {
    
    @Binding var showNewTweetView: Bool
    @State private var newTweetText: String = ""
    
    var body: some View {
        
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                topItems
                
                HStack(spacing: 16) {
                    VStack {
                        Image(systemName: "person.circle")
                            .resizable()
                        .frame(width: 38, height: 38)
                        
                        Spacer()
                    }
                    
                    VStack {
                        TextField("What's Happening?", text: $newTweetText, axis: .vertical)
                            .padding(.top)
                        
                        Spacer()
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
        }
        .preferredColorScheme(.dark)
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(showNewTweetView: .constant(true))
    }
}

extension NewTweetView {
    
    private var topItems: some View {
        HStack {
            
            Button {
                showNewTweetView.toggle()
            } label: {
                Text("Cancel")
            }
            
            Spacer()
            
            Button {
                //
            } label: {
                Text("Tweet")
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color.theme.twitter, in: Capsule())
            }

        }
        .foregroundColor(Color.theme.text)
        .frame(maxWidth: .infinity)
        .padding(.bottom)
        .background(Color.theme.text.opacity(0.02))
    }
}
