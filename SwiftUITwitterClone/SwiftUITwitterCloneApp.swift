//
//  SwiftUITwitterCloneApp.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

@main
struct SwiftUITwitterCloneApp: App {
    
    @StateObject private var mainViewModel: MainViewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            MainView()
                .preferredColorScheme(.dark)
                .environmentObject(mainViewModel)
            
        }
    }
}
