//
//  TweetDetailView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import SwiftUI

struct TweetDetailView: View {
    
    @Binding var showTweetDetail: Bool
    
    var body: some View {
        
        VStack {
            Text("Tweet detail view")
            
            Button {
                showTweetDetail.toggle()
            } label: {
                Text("Go back")
                    .foregroundColor(Color.blue)
            }
        }
        .preferredColorScheme(.dark)
        

    }
}

struct TweetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TweetDetailView(showTweetDetail: .constant(true))
    }
}
