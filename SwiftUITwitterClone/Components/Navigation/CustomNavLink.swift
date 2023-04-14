//
//  CustomNavLink.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

/*
 
 Custom Navigation Link leveraging NavigationLink
 
 NavigationLink doc. :
 - struct NavigationLink<Label, Destination>: View where Label: View, Destination: View
 - init(destination: Destination, @ViewBuilder label: () -> Label)
 
 */

struct CustomNavLink<Label:View, Destination:View>: View {
    
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        
        NavigationLink {
            // put it in container so we have our nav bar
            CustomNavBarContainerView {
                destination
            }
            // hide default nav bar
            .navigationBarHidden(true)
        } label: {
            label
        }

    }
}

struct CustomNavLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
            CustomNavLink(
                destination: Text("destination")) {
                    Text("click me")
                }
        }
    }
}
