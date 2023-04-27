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
            
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                
                topItems
                
                searchBar
                
                Spacer()
                
                Text("Messages")
                
                Spacer()
            }
            .foregroundColor(Color.theme.text)
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
            .preferredColorScheme(.dark)
    }
}

extension MessagesView {
    
    private var topItems: some View {
        HStack(spacing: 8) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 30, height: 30)
            
            Spacer()
            
            Text("Messages")
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "gearshape")
                .font(.title3)
                .frame(width: 30, height: 30)
            
        }
        .padding(.horizontal)
        .foregroundColor(Color.theme.text)
    }
    
    private var searchBar: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
            
            TextField("Search Twitter", text: $searchTxt)
                .foregroundColor(Color.theme.text)
            
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.text.opacity(0.2))
        )
        .padding(.horizontal)
    }
}
