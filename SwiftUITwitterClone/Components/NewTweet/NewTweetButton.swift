//
//  NewTweetButton.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/2/23.
//

import SwiftUI

struct NewTweetButton: View {
    
    @ObservedObject var vm: MainViewModel
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        vm.showNewTweetView.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(Color.theme.text)
                        .padding()
                        .background(Color.theme.twitter, in: Circle())
                    }
                }
            }
        }
        .padding(.bottom, 85)
        .padding(.trailing)
        .zIndex(2)
    }
}

struct NewTweetButton_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetButton(vm: MainViewModel())
    }
}
