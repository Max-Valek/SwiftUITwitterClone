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
            
            Color.black.ignoresSafeArea()
            
            VStack {
                
                HStack(spacing: 8) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                    
                    Spacer()
                    
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
                    
                    Spacer()
                    
                    Image(systemName: "gearshape")
                }
                .padding(.horizontal)
                .foregroundColor(.white)
                
                Spacer()
                
                Text("Search")
                
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.vertical, 70)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
