//
//  ContentView.swift
//  Stacks
//
//  Created by Dali Han on 2020/7/29.
//

import SwiftUI

struct ContentView: View {
    @State var tapped: Bool = false

    @State var randomColor : UIColor = .random
    @State var randomColor1 : UIColor = .random
    @State var randomColor2 : UIColor = .random
    @State var randomColor3 : UIColor = .random

    var body: some View {
        VStack {
            HStack {
                Color(randomColor)
                Color(randomColor1)
                Color(randomColor2)
                Color(randomColor3)
                Color(randomColor)
                    .onTapGesture {
                        self.tapped.toggle()
                    }
            }

            if tapped {
                VStack {
                    Color(randomColor1)
                    Color(randomColor2)
                    Color(randomColor1)

                    HStack {
                        Color(randomColor3)
                        Color(randomColor1)
                        Color(randomColor2)
                        Color(randomColor3)
                        Color(randomColor3)
                            .onTapGesture {
                                self.tapped.toggle()
                            }
                    }

                    Color(randomColor1)
                    Color(randomColor2)
                    Color(randomColor1)
                }
            }

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 0.6
        )
    }
}

