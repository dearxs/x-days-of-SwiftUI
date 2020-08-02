//
//  ContentView.swift
//  AnotherProgressView
//
//  Created by Dali Han on 2020/8/2.
//  Copyright © 2020 Dali Han. All rights reserved.
//. Credit to: https://www.youtube.com/watch?v=K5OLnQJueNM&feature=youtu.be

import SwiftUI

struct ContentView: View {
    
    let  backgroundColor = Color.RGB(r: 67, g: 66, b: 55)
    @State var progress: CGFloat = 0
    var body: some View {
        
        VStack {
            ZStack {
                Rectangle().fill(backgroundColor)
                ActivityIndicator(progress: $progress)
            }.edgesIgnoringSafeArea(.all)
            
            Slider(value: $progress, in: (0...100), step: 1)
        }

    }
}

struct ActivityIndicator: View {
    
    let progressColor = Color.RGB(r: 216, g: 201, b: 56)
    let secondaryColor = Color.RGB(r: 58, g: 57, b: 46)
    let textColor = Color.RGB(r: 155, g: 147, b: 60)
    
    @Binding var progress: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 35)
                .fill(secondaryColor)
                
            Circle()
                .trim(from: 0.0, to: progress / 100)
                .stroke(lineWidth: 50)
                .fill(progressColor)
                .rotationEffect(Angle.degrees(270))
                .rotation3DEffect(
                    Angle.degrees(180),
                    axis: (0, 1, 0)
                )
            
            HStack(alignment: .top, spacing: 3) {
                Text("\(Int(progress))")
                    .font(.largeTitle).bold()
                    .foregroundColor(textColor)
                Text("%")
                    .font(.body).bold()
                    .foregroundColor(textColor)
                    .offset(y: 4)
            }
                
        }.frame(width: 200, height: 200)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    
    static func RGB(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r/255, green: g/255, blue: b/255)
    }

}
