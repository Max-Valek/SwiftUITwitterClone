//
//  TweetView.swift
//  SwiftUITwitterClone
//
//  Created by Max Valek on 4/14/23.
//

import SwiftUI

struct TweetView: View {
    
    @State private var isLiked: Bool = false
    @State private var isRetweeted: Bool = false
    
    @State private var showTweetDetail: Bool = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 38, height: 38)
            
            VStack(alignment: .leading, spacing: 8) {
                
                HStack {
                    Text("User")
                        .font(.title3)
                    
                    Text("@user • 1m")
                        .font(.headline)
                        .foregroundColor(Color.theme.text.opacity(0.4))
                    
                    Spacer()
                    
                    Text("•••")
                        .foregroundColor(Color.theme.text.opacity(0.4))
                }
                
                Text("This is a sample tweet. It is not very pretty and this is just sample text.")
                    .onTapGesture {
                        showTweetDetail.toggle()
                    }
                
                HStack {
                    Button {
                        // comment pressed
                    } label: {
                        HStack {
                            Image(systemName: "bubble.left")
                            Text("82")
                        }
                    }

                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isRetweeted.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .fontWeight(isRetweeted ? .bold : .semibold)
                                .foregroundColor(isRetweeted ? Color.green : Color.theme.text.opacity(0.4))
                            Text("71")
                        }
                    }

                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isLiked.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .foregroundColor(isLiked ? Color.red : Color.theme.text.opacity(0.4))
                            Text("1,538")
                        }
                    }

//                    CustomButton(systemImage: isLiked ? "heart.fill" : "heart", status: isLiked, activeTint: Color.theme.text.opacity(0.4), inactiveTint: Color.clear) {
//                        isLiked.toggle()
//                    }
                    Spacer()
                    
                    HStack {
                        Image(systemName: "chart.bar")
                        Text("182K")
                    }
                    Spacer()
                    
                    Button {
                        // share pressed
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.theme.text.opacity(0.4))
                
            }
        }
        .foregroundColor(Color.theme.text)
        .padding(.top, 8)
        .preferredColorScheme(.dark)
        .fullScreenCover(isPresented: $showTweetDetail) {
            TweetDetailView(showTweetDetail: $showTweetDetail)
        }
    }
    
    // custom button
    @ViewBuilder
    func CustomButton(systemImage: String, status: Bool, activeTint: Color, inactiveTint: Color, onTap: @escaping () -> ()) -> some View {
        
        Button {
            onTap()
        } label: {
            Image(systemName: systemImage)
                .font(.title2)
                .particleEffect(
                    systemImage: systemImage,
                    font: .title2,
                    status: status,
                    activeTint: activeTint,
                    inactiveTint: inactiveTint)
                .foregroundColor(status ? activeTint : inactiveTint)
                .padding(.horizontal, 18)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(status ? activeTint.opacity(0.25) : Color("ButtonColor"))
                )
        }

    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView()
    }
}
