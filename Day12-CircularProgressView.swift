//
//  ContentView.swift
//  CircularProgress
//
//  Created by Dali Han on 2020/8/1.
//  Copyright © 2020 Dali Han. All rights reserved.
//
//  Credit to Josh Kannenberg: https://www.youtube.com/watch?v=095s3BF-yHA
import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var percentage: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                ZStack {
                    Pulsation()
                    Track()
                    Label(percentage: percentage)
                    Outline(percentage: percentage)
                }
                Spacer()
//                Button(action: {
//                    self.percentage = CGFloat(85)
//                }) {
//                    Image(systemName: "play.circle.fill").resizable()
//                        .frame(width: 65, height: 65)
//                        .aspectRatio(contentMode: .fit)
//                        .foregroundColor(.white)
//                }
            }
        }.onReceive(timer) { _ in
            if self.percentage < 100 {
                self.percentage += 10
            } else {
                self.timer.upstream.connect().cancel()
            }
            
        }
    }
}

struct Label : View {
    var percentage: CGFloat = 0
    
    var body: some View {
        ZStack {
            Text(String(format: "%.0f", percentage) + "%")
                .fontWeight(.heavy)
                .font(.system(size: 65))
                .colorInvert()
        }
    }
}

struct Outline : View {
    var percentage: CGFloat = 0
    var colors: [Color] = [Color.outlineColor]
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.clear)
                .frame(width: 250, height: 250)
                .overlay(
                    Circle()
                        .trim(from: 0, to: percentage * 0.01)
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
            ).animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
            
        }
    }
}

struct Track: View {
    var colors: [Color] = [Color.trackColor]
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.backgroundColor)
                .frame(width: 250, height: 250)
                .overlay(
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 20))
                        .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
            )
        }
    }
}

struct Pulsation: View {
    @State private var pulsate = false
    
    var colors: [Color] = [Color.pulsatingColor]
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.pulsatingColor)
                .frame(width: 250, height: 250)
                .scaleEffect(pulsate ? 1.3 : 1.1)
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear {
                    self.pulsate.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// extension to Color

extension Color {
    
    static func RGB(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r/255, green: g/255, blue: b/255)
    }
    
    static let backgroundColor = Color.RGB(r: 21, g: 22, b: 33)
    static let outlineColor = Color.RGB(r: 54, g: 255, b: 203)
    static let trackColor = Color.RGB(r: 45, g: 56, b: 95)
    static let pulsatingColor = Color.RGB(r: 73, g: 113, b: 148)
}

