//
//  TweetProfilePhotoButtonView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import SwiftUI

// Same as ProfilePhotoButtonView but for tweets, combine the 2 later

struct TweetProfilePhotoButtonView: View {
    
    //@Binding var showProfile: Bool
    
    let user: User
    
    var body: some View {
        Button {
            //showProfile.toggle()
        } label: {
            Image(user.profilePhoto ?? "default")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 38, height: 38)
        }
    }
}

struct TweetProfilePhotoButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TweetProfilePhotoButtonView(user: User.doge)
    }
}
