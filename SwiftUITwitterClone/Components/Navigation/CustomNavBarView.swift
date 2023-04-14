//
//  CustomNavBarView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

/*
 
 Custom Nav Bar
 
 The top of a view that has been navigated to
 
 */

struct CustomNavBarView: View {
    // for back button functionality
    @Environment(\.presentationMode) var presentationMode
    // passed in by container
    let showBackButton: Bool
    let title: String
    let subtitle: String?
    
    var body: some View {
        
        HStack {
            
            if showBackButton {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButton
                    .opacity(0)
            }
            
        }
        .padding()
        .accentColor(.white)
        .foregroundColor(.white)
        .font(.headline)
        .background(Color.blue)
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavBarView(showBackButton: true, title: "title", subtitle: "subtitle")
            Spacer()
        }
    }
}

extension CustomNavBarView {
    
    private var backButton: some View {
        Button {
            // dismiss when back button pressed
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
}
