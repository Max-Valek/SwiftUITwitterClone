//
//  MessagesView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/27/23.
//

import SwiftUI

struct MessagesView: View {
    
    @State private var searchTxt: String = ""
    
    var body: some View {
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            VStack {
                
                HStack(spacing: 8) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                    
                    Spacer()
                    
                    Text("Messages")
                        .font(.headline)
                    
                    Spacer()
                    
                    Image(systemName: "gearshape")
                    
                }
                .padding(.horizontal)
                .foregroundColor(.white)
                
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("Search Twitter", text: $searchTxt)
                        .foregroundColor(.white)
                    
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.secondary)
                )
                .padding(.horizontal)
                
                Spacer()
                
                Text("Messages")
                
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.vertical, 70)
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
