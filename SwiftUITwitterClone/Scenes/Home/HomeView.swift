//
//  HomeView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var followingPressed: Bool = false
    @Namespace private var topTabsNamespace
    
    var body: some View {
        
        ZStack {
            
            Color.black.ignoresSafeArea()
        
            VStack {
                
                topImages
                
                topTabs
                
                if !followingPressed {
                    ForYouView()
                        .transition(.move(edge: .leading))
                }
                if followingPressed {
                    FollowingView()
                        .transition(.move(edge: .trailing))
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 40)
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    
    private var topImages: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 35, height: 35)
            
            Spacer()
            
            Image("twitter")
                .resizable()
                .frame(width: 45, height: 45)
            
            Spacer()
            
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .opacity(0)
        }
    }
    
    private var topTabs: some View {
        HStack {
            Spacer()
            
            VStack {
                Text("For You")
                    .foregroundColor(followingPressed ? .gray : .white)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.25)) {
                            followingPressed = false
                        }
                    }
                
                // tab underline
                if !followingPressed {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 50, height: 3)
                        .matchedGeometryEffect(id: "tab_underline", in: topTabsNamespace)
                }
                
                if followingPressed {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 50, height: 3)
                        .foregroundColor(.clear)
                }
                
            }
            
            
            Spacer()
            
            VStack {
                Text("Following")
                    .foregroundColor(followingPressed ? .white : .gray)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.25)) {
                            followingPressed = true
                        }
                }
                
                // tab underline
                if followingPressed {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 50, height: 3)
                        .matchedGeometryEffect(id: "tab_underline", in: topTabsNamespace)
                }
                
                if !followingPressed {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 50, height: 3)
                        .foregroundColor(.clear)
                }
            }
            
            Spacer()
        }
        .font(.headline)
    }
}
