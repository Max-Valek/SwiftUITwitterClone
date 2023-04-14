//
//  CustomNavView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

/*
 
 Custom navigation view
 
 Once youre inside a navigation view, the system will know
 that any children are also inside it.
 
 Leverages Apple's navigation view by default
    - Contains a NavigationView with the content and hides it
    - wont see the nav bar from it but will get all the performance
    benefits from NavigationView
 */

struct CustomNavView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        NavigationView {
            
            CustomNavBarContainerView {
                content
            }
            // .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CustomNavView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
            Color.red.ignoresSafeArea()
        }
    }
}

// not swipeable after removing header of default nav view
// change that w this extension
// (doesnt work, navigation view isnt even swipeable anymore it seems)
extension UINavigationController {
    
    // override what happens when the navigation controller
    // (underlying controller for nav view) loads
    open override func viewDidLoad() {
        // call all of the stuff that would originally happen
        super.viewDidLoad()
        // so our custom nav view isnt the delegate
        // by default it will still be available
        interactivePopGestureRecognizer?.delegate = nil
    }
}
