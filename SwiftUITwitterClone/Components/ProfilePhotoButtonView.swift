//
//  ProfilePhotoButtonView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import SwiftUI

struct ProfilePhotoButtonView: View {
    
    @Binding var showProfile: Bool
    
    var body: some View {
        Button {
            showProfile.toggle()
        } label: {
            Image("doge")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 30, height: 30)
        }
    }
}

struct ProfilePhotoButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoButtonView(showProfile: .constant(false))
    }
}
