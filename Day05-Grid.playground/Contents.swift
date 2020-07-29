//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct ContentView : View {
    
    private var columns: [GridItem] = [
        
        GridItem(.fixed(50), spacing: 10),
        GridItem(.fixed(200), spacing: 10),
//        GridItem(.fixed(50), spacing: 50)
//        GridItem(.adaptive(minimum: 10), spacing: 16),
//        GridItem(.adaptive(minimum: 20, maximum: 50), spacing: 16),
//        GridItem(.adaptive(minimum: 10), spacing: 16)
    ]
    
    var body: some View {
        ScrollView{
            VStack {
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: 16,
                    pinnedViews: [] //[.sectionHeaders, .sectionFooters]
                ) {
                    Section(header: Text("Section 1 ").font(.title)) {
                        ForEach(0...10, id: \.self) { index in
                            let randomColor: Color = .random
                            randomColor
                        }
                    }
                    
                    Section(header: Text("Section 2").font(.title)) {
                        ForEach(11...35, id:\.self) { index in
                            let randomColor: Color = .random
                            randomColor
                        }
                    }
                }
            }
            
        }
    }
}

extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}


// Present the view controller in the Live View window
PlaygroundPage.current.setLiveView(ContentView())
