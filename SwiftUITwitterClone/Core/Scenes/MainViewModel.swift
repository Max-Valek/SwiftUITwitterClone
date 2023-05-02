//
//  MainViewModel.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 5/1/23.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var currentUser: User = User.doge
    
}
