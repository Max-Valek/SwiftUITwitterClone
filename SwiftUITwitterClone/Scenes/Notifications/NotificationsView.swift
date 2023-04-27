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
    
    var body: some View {
        
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            VStack {
                
                HStack(spacing: 8) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                    
                    Spacer()
                    
                    Text("Notifications")
                        .font(.headline)
                    
                    Spacer()
                    
                    Image(systemName: "gearshape")
                    
                }
                .padding(.horizontal)
                .foregroundColor(.white)
                
                tabs
                
                Spacer()
                
                Text("Notifications")
                
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.vertical, 70)
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}

extension NotificationsView {
    
    private var tabs: some View {
        HStack(spacing: 8) {
            
            HStack {
                Spacer()
                
                VStack {
                    Text("All")
                        .foregroundColor(selectedTab == .all ? .white : .gray)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.25)) {
                                selectedTab = .all
                            }
                        }
                    
                    // tab underline
                    if selectedTab == .all {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 3)
                            .foregroundColor(.blue)
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
                        .foregroundColor(selectedTab == .verified ? .white : .gray)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.25)) {
                                selectedTab = .verified
                            }
                        }
                    
                    // tab underline
                    if selectedTab == .verified {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 3)
                            .foregroundColor(.blue)
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
                        .foregroundColor(selectedTab == .mentions ? .white : .gray)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.25)) {
                                selectedTab = .mentions
                            }
                        }
                    
                    // tab underline
                    if selectedTab == .mentions {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 3)
                            .foregroundColor(.blue)
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
