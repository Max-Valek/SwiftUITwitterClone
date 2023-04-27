//
//  SpacesView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/27/23.
//

import SwiftUI

struct SpacesView: View {
    
    @State private var searchTxt: String = ""
    
    var body: some View {
        
        ZStack {
            
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                
                topItems
                
                searchBar
                
                Spacer()
                
                Text("Spaces")
                
                Spacer()
            }
            .foregroundColor(Color.theme.text)
        }
    }
    
}

struct SpacesView_Previews: PreviewProvider {
    static var previews: some View {
        SpacesView()
            .preferredColorScheme(.dark)
    }
}

extension SpacesView {
    
    private var topItems: some View {
        HStack(spacing: 8) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 35, height: 35)
            
            Spacer()
            
            Text("Spaces")
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 35, height: 35)
                .opacity(0)
            
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
