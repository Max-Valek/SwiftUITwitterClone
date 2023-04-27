//
//  ProfileView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/27/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        ZStack {
            
            Color.theme.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // header + buttons
                VStack {
                    ZStack(alignment: .top) {
                        Rectangle()
                            .fill(Color.theme.twitter)
                            // .frame(height: 140)
                            .frame(maxWidth: .infinity)
                            .ignoresSafeArea()
                        
                        VStack {
                            HStack {
                                Image(systemName: "arrow.left")
                                
                                Spacer()
                                
                                Image(systemName: "magnifyingglass")
                            }
                            .padding()
                        }
                    }
                    
                }
                .frame(height: 80)
                
                HStack(alignment: .center) {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                        .background(Color.black)
                        .clipShape(Circle())
                        .offset(y: -20)
                        
                    Spacer()
                    
                    Button {
                        // edit profile pressed
                    } label: {
                        Text("Edit profile")
                            .font(.subheadline)
                            .padding(4)
                            .padding(.horizontal, 4)
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.theme.text, lineWidth: 1))
                        
                    }
                }
                .padding(.horizontal)
                
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text("User")
                            .font(.title2)
                            .fontWeight(.black)
                        Text("@user")
                            .font(.headline)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                .offset(y: -10)
                
                HStack {
                    Text("tabs")
                }
                
                VStack {
                    Text("tweets")
                }
                Spacer()
            }
            .foregroundColor(Color.theme.text)
            
            
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}
