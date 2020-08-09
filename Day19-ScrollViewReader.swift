//
//  ContentView.swift
//  ScrollViewReader
//
//  Created by Dali Han on 2020/8/9.
//  Credit: ZhouZi
//  Link: https://zhuanlan.zhihu.com/p/158209237

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollReaderTest()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ScrollReaderTest: View {
    private var list = ScrollItem.populateItems(50)
    @State private var position: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollViewReader { proxy in
                    LazyVStack(alignment: .leading) {
                        ForEach(list, id:\.id) { item in
                            HStack {
                                Circle()
                                    .fill(Color.red)
                                Text(item.title).id(item.id)
                                Circle()
                                    .fill(Color.blue)
                            }.padding()
                        }
                    }
                    .padding()
                    .onChange(of: position, perform: { position in
                        switch position {
                        case 1:
                            let id = list.first!.id
                            withAnimation(Animation.easeInOut){
                                proxy.scrollTo(id, anchor: .top)
                            }
                        case 2:
                            let id = list[Int(list.count / 2)].id
                            withAnimation(Animation.easeInOut){
                                proxy.scrollTo(id, anchor: .center)
                            }
                        case 3:
                            let id = list.last!.id
                            withAnimation(Animation.easeInOut){
                                proxy.scrollTo(id, anchor: .bottom)
                            }
                        default: break
                        }
                    })
                }
            }
            .navigationTitle("Scroll Postioning")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    HStack {
                        Button("Top") {
                            position = 1
                        }
                        Button("Mid") {
                            position = 2
                        }
                        Button("End") {
                            position = 3
                        }
                    }
                }
            }
        }
    }
}


struct ScrollItem: Identifiable {
    var id = UUID()
    var title: String
    
    static func populateItems(_ count: Int) -> [ScrollItem] {
        var result: [ScrollItem] = []
        for i in 0 ..< count {
            result.append(ScrollItem(title: String("index:\(i) - title: NO. \(Int.random(in: 1000...5000))")))
        }
        return result
    }
}
struct ScrollReaderTest1: View {
    var body: some View {
        ScrollView(.horizontal) {
            ScrollViewReader { proxy in
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.red, .blue]),
                                         startPoint: .leading, endPoint: .trailing))
                    .frame(width: 1000, height: 300, alignment: .center)
                    .id("rec")
                    .onAppear {
                        proxy.scrollTo("rec", anchor: .trailing)
                    }
            }
        }
    }
}
