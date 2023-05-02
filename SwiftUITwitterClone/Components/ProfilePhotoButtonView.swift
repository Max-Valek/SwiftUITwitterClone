//
//  ProfilePhotoButtonView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import SwiftUI

struct ProfilePhotoButtonView: View {
    
    @ObservedObject var vm: MainViewModel
    
    var body: some View {
        
        Button {
            vm.showProfile.toggle()
        } label: {
            Image(vm.loggedInUser.profilePhoto ?? "default")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 30, height: 30)
        }
    }
}

struct ProfilePhotoButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoButtonView(vm: MainViewModel())
    }
}
