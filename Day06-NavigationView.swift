//
//  ContentView.swift
//  Tutorial
//
//  Created by Dali Han on 2020/7/24.
//  Copyright © 2020 Dali Han. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Text("Navigate")
                    })
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Text("Navigate")
                    })
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Text("Navigate")
                    })
            }
            .navigationBarTitle("Home")
            .navigationBarItems(leading: Text("Cancel"), trailing: Text("Done"))
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
    }
}
