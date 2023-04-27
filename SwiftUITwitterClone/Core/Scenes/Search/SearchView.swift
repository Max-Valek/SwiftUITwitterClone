//
//  SearchView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/18/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTxt: String = ""
    var body: some View {
        
        ZStack {
            
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                
                topItems
                
                Spacer()
                
                Text("Search")
                
                Spacer()
            }
            .foregroundColor(Color.theme.text)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
    }
}

extension SearchView {
    
    private var topItems: some View {
        HStack(spacing: 8) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 30, height: 30)
            
            Spacer()
            
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
            
            Spacer()
            
            Image(systemName: "gearshape")
                .font(.title3)
                .frame(width: 30, height: 30)
        }
        .padding(.horizontal)
        .foregroundColor(Color.theme.text)
    }
}
