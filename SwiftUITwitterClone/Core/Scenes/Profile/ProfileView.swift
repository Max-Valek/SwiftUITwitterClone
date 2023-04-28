//
//  ProfileView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/27/23.
//

import SwiftUI

enum ProfileTab: String, CaseIterable {
    case tweets = "Tweets"
    case replies = "Replies"
    case media = "Media"
    case likes = "Likes"
}

struct ProfileView: View {
    
    @State private var selectedTab: ProfileTab = .tweets
    
    @Namespace private var profileNamespace
    
    var body: some View {
        
        ZStack {
            
            Color.theme.background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                headerAndButtons
                
                photoAndEditProfile
                
                nameAndUsername
                
                info
                
                tabs
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 0.5)
                    .foregroundColor(Color.theme.text.opacity(0.2))
                
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

extension ProfileView {
    
    private var headerAndButtons: some View {
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
    }
    
    private var photoAndEditProfile: some View {
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
    }
    
    private var nameAndUsername: some View {
        HStack {
            
            VStack(alignment: .leading) {
                Text("User")
                    .font(.title2)
                    .fontWeight(.black)
                Text("@user")
                    .font(.headline)
                    .foregroundColor(Color.theme.text.opacity(0.5))
            }
            
            Spacer()
        }
        .padding(.horizontal, 25)
        .padding(.bottom, -10)
        .offset(y: -20)
    }
    
    private var info: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 16) {
                HStack(spacing: 2) {
                    Image(systemName: "location.north.circle")
                    Text("Location")
                }
                
                HStack(spacing: 2) {
                    Image(systemName: "calendar")
                    Text("Joined April 2023")
                }
                Spacer()
            }
            .font(.subheadline)
            .foregroundColor(Color.theme.text.opacity(0.65))
            
            HStack(spacing: 16) {
                HStack(spacing: 2) {
                    Text("100")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Following")
                        .font(.subheadline)
                        .foregroundColor(Color.theme.text.opacity(0.65))
                }
                HStack(spacing: 2) {
                    Text("100")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Followers")
                        .font(.subheadline)
                        .foregroundColor(Color.theme.text.opacity(0.65))
                }
            }
            
        }
        .padding(.horizontal, 25)
    }
    
    private var tabs: some View {
        HStack {
            
            Spacer()
            
            ForEach(ProfileTab.allCases, id: \.self) { tab in
                VStack {
                    Text(tab.rawValue)
                        .foregroundColor(selectedTab == tab ? Color.theme.text : Color.theme.text.opacity(0.4))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.25)) {
                                selectedTab = tab
                            }
                        }
                    
                    // tab underline
                    if selectedTab == tab {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 3)
                            .foregroundColor(Color.theme.twitter)
                            .matchedGeometryEffect(id: "tab_underline", in: profileNamespace)
                    } else {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 3)
                            .foregroundColor(.clear)
                    }
                }
                Spacer()
            }
        }
        .padding(.top)
    }
}
