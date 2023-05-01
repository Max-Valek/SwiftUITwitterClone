//
//  MessagesView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/27/23.
//

import SwiftUI

struct MessagesView: View {
    
    @State private var searchTxt: String = ""
    
    @State private var showProfile: Bool = false
    
    var body: some View {
        ZStack {
            
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                
                topItems
                
                searchBar
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 0.5)
                    .foregroundColor(Color.theme.text.opacity(0.2))
                
                ScrollView {
                    HStack {
                        Image(systemName: "envelope")
                            .font(.title)
                            .padding(12)
                            .background(Circle().fill(Color.theme.background))
                            .padding(1)
                            .background(Color.theme.text.opacity(0.4), in: Circle())
                        
                        Text("Message Requests")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    
                    ForEach(0...5, id: \.self) { _ in
                        HStack {
                            Image(systemName: "person")
                                .font(.title)
                                .padding(12)
                                .background(Circle().fill(Color.theme.background))
                                .padding(1)
                                .background(Color.theme.text.opacity(0.4), in: Circle())
                            
                            VStack {
                                HStack(spacing: 2) {
                                    Text("Group")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.theme.text)
                                    
                                    Text("•")
                                    
                                    Text("20m")
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("User sent @user's Tweet")
                                    
                                    Spacer()
                                }
                            }
                            .foregroundColor(Color.theme.text.opacity(0.4))
                            
                            Spacer()
                        }
                    }
                    
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .foregroundColor(Color.theme.text)
            .fullScreenCover(isPresented: $showProfile) {
                ProfileView(showProfile: $showProfile)
                    .preferredColorScheme(.dark)
            }
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
            
            ProfilePhotoButtonView(showProfile: $showProfile)
            
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
            
            TextField("Search Direct Messages", text: $searchTxt)
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
