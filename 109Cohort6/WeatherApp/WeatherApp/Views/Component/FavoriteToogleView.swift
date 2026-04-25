//
//  FavoriteToogleView.swift
//  WeatherApp
//
//  Created by Naqui Darby on 4/23/26.
//

import SwiftUI

struct FavoriteToggle: View {
    @Binding var isFavorite: Bool
    
    @State private var offsetY: CGFloat = 0
    @State private var scale: CGFloat = 1
    @State private var opacity: CGFloat = 0
    
    var body: some View {
        ZStack{
            Image(systemName: "heart.fill")
                .foregroundStyle(.red)
                .font(.title)
                .opacity(opacity)
                .scaleEffect(scale)
                .offset(y: offsetY)
            Toggle(isOn: $isFavorite){
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(isFavorite ? .red : .secondary)
                    .font(.title)
            }
            .toggleStyle(.button)
            .buttonStyle(.plain)
            .animation(.spring, value: isFavorite)
            .onChange(of: isFavorite) { _, newValue in
                guard newValue == true else {
                    // if error or condition not met do this
                    return
                }
                //proceed if guard condition is met
                
                //appear and grow
                withAnimation(.spring(response:0.5, dampingFraction: 0.4)){
                    scale = 1.2
                    opacity = 1
                }
                
                // float(go up) and vanish
                withAnimation(.easeInOut(duration:0.5).delay(0.5)){
                    offsetY = -100
                    opacity = 0
                }
                
                // reset the value
                DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
                    scale = 1
                    offsetY = 0
                }
            }
        }
    }
}
