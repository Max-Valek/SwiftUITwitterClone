//
//  NotificationsView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/27/23.
//

import SwiftUI

enum NotificationTab {
    case all, verified, mentions
}

struct NotificationsView: View {
    
    @State private var selectedTab: NotificationTab = .all
    @Namespace var notificationsNamespace
    @State private var showProfile: Bool = false
    @ObservedObject var vm: MainViewModel
    
    var body: some View {
        
        ZStack {
            Color.theme.background.ignoresSafeArea()
            VStack {
                topItems
                tabs
                Spacer()
                Text("Notifications")
                Spacer()
            }
            .foregroundColor(Color.theme.text)
            .fullScreenCover(isPresented: $showProfile) {
                ProfileView(vm: vm, user: User.doge)
                    .preferredColorScheme(.dark)
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(vm: MainViewModel())
            .preferredColorScheme(.dark)
    }
}

extension NotificationsView {
    // logged in user profile image, title, settings button
    private var topItems: some View {
        HStack(spacing: 8) {
            
            ProfilePhotoButtonView(vm: vm)
            
            Spacer()
            
            Text("Notifications")
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "gearshape")
                .font(.title3)
                .frame(width: 30, height: 30)
            
        }
        .padding(.horizontal)
        .foregroundColor(Color.theme.text)
    }
    // all, verified, and mentions tabs + underline
    private var tabs: some View {
        HStack(spacing: 8) {
            
            HStack {
                Spacer()
                
                VStack {
                    Text("All")
                        .foregroundColor(selectedTab == .all ? Color.theme.text : Color.theme.text.opacity(0.4))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.25)) {
                                selectedTab = .all
                            }
                        }
                    
                    // tab underline
                    if selectedTab == .all {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 3)
                            .foregroundColor(Color.theme.twitter)
                            .matchedGeometryEffect(id: "tab_underline", in: notificationsNamespace)
                    } else {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 3)
                            .foregroundColor(.clear)
                    }
                    
                }
                
                
                Spacer()
                
                VStack {
                    Text("Verified")
                        .foregroundColor(selectedTab == .verified ? Color.theme.text : Color.theme.text.opacity(0.4))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.25)) {
                                selectedTab = .verified
                            }
                        }
                    
                    // tab underline
                    if selectedTab == .verified {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 3)
                            .foregroundColor(Color.theme.twitter)
                            .matchedGeometryEffect(id: "tab_underline", in: notificationsNamespace)
                    } else {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 3)
                            .foregroundColor(.clear)
                    }
                    
                }
                
                Spacer()
                
                VStack {
                    Text("Mentions")
                        .foregroundColor(selectedTab == .mentions ? Color.theme.text : Color.theme.text.opacity(0.4))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.25)) {
                                selectedTab = .mentions
                            }
                        }
                    
                    // tab underline
                    if selectedTab == .mentions {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 3)
                            .foregroundColor(Color.theme.twitter)
                            .matchedGeometryEffect(id: "tab_underline", in: notificationsNamespace)
                    } else {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 3)
                            .foregroundColor(.clear)
                    }
                    
                }
                
                Spacer()
            }
            .fontWeight(.semibold)
            .font(.headline)
        }
    }
}
