//
//  TweetProfilePhotoButtonView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import SwiftUI

struct TweetProfilePhotoButtonView: View {
    
    @ObservedObject var vm: MainViewModel
    let user: User
    
    var body: some View {
        
        Button {
            vm.selectedUser = user
            vm.showTweetAuthorProfile.toggle()
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
        TweetProfilePhotoButtonView(vm: MainViewModel(), user: User.doge)
    }
}
