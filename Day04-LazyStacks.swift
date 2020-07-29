//  ContentView.swift
//  LazyStacks
//
//  Created by Dali Han on 2020/7/29.
//

import SwiftUI

struct ListItem: View {
    var index: Int
    
    var body: some View {
        Text("Item \(index)").padding(.all, 20)
    }
    
    init(index: Int) {
        self.index = index
        print("item \(index)")
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0 ..< 100) { index in
                        ListItem(index: index)
                    }
                }
            }
            ScrollView {
                ScrollViewReader { scrollView in
                    LazyVStack(alignment: .leading) {
                        ForEach(0 ..< 100) { index in
                            ListItem(index: index).id(index)
                                .onTapGesture {
                                    withAnimation {
                                        scrollView.scrollTo(index, anchor: .top)
                                    }
                                }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}