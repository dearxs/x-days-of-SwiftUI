//
//  ContentView.swift
//  Toolbar
//
//  Created by Dali Han on 2020/7/22.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var percent = 0.05
    
    var body: some View {
        ProgressView("Loading...", value: percent)
//            .progressViewStyle(CircularProgressViewStyle())
            .padding(.all, 20)
            .onReceive(timer) { _ in
                if percent < 1 {
                    percent += 0.1
                } else {
                    self.timer.upstream.connect().cancel()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
