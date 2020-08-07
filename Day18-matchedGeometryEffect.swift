//
//  ContentView.swift
//  Text
//
//  Created by Dali Han on 2020/7/24.
//  Credit to azam sharp
//  Link: https://www.youtube.com/watch?v=lvwgmJJPtLw

import SwiftUI

struct ContentView: View {
    @State var isToggled : Bool = false
    @Namespace var ns
    
    var body: some View {
        HStack {
            if !isToggled {
                Circle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                    .matchedGeometryEffect(id: 007, in: ns)
            }
            
            
            Spacer()
            
            Button("Toggle") {
                withAnimation{
                    isToggled.toggle()
                }
                
            }
            
            Spacer()
            
            VStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                
                if isToggled {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                        .matchedGeometryEffect(id: 007, in: ns)
                }
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
            }
            
            
            
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 
