//
//  HomeView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ZStack {
            Color.black
            
            VStack {
                
                // top icons and tabs
                VStack {
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 35, height: 35)
                        
                        Spacer()
                        
                        Image("twitter")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Spacer()
                        
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .opacity(0)
                    }
                    
                    //Spacer()
                    
                    HStack {
                        Spacer()
                        Text("For You")
                        
                        Spacer()
                        Spacer()
                        
                        Text("Following")
                        
                        Spacer()

                    }
                    .font(.system(size: 20, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                }
                .padding()
                .padding(.top, 40)
                .background(Color.white.opacity(0.03))
                
                Spacer()
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
