//
//  NewTweetView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import SwiftUI

struct NewTweetView: View {
    
    @Binding var showNewTweetView: Bool
    
    var body: some View {
        
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                topItems
                
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
            }

        }
        .foregroundColor(Color.theme.text)
        .frame(maxWidth: .infinity)
        .padding(.bottom)
        .background(Color.theme.text.opacity(0.02))
    }
}
