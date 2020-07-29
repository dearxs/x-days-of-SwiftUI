//
//  ContentView.swift
//  Text
//
//  Created by Dali Han on 2020/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // sf symbols like text
            Image(systemName: "lasso")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            // add images to assets
            // image is view
            Image("general")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                //    .clipShape(Circle())
                .cornerRadius(22)
            
            // built-in colors
            Text("Poems")
                .background(Color.blue)
                .padding(.all, 10)
            Text("Poems")
                .padding(.all, 10)
                .background(Color.red)
                .cornerRadius(22)
                .rotationEffect(Angle(degrees: 30), anchor: .center)
            
            // color literals
            // color is view
            Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
                .padding(.all, 10)
                .frame(width: 100, height: 100, alignment: .center)
            
        }
        // color sets in assets
        // you can ignore safe areas
        .background(Color("brand")).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
