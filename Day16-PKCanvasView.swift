//
//  ContentView.swift
//  Pencil
//
//  Created by Dali Han on 2020/8/4.
//  Copyright © 2020 Dali Han. All rights reserved.
//  Credit to Kavsoft
//. Link: https://www.youtube.com/watch?v=LR-ttBoa89M

import SwiftUI
import PencilKit

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State var color : Color = .black
    @State var type: PKInkingTool.InkType = .pencil
    
    var body: some View {
        NavigationView {
            // Drawing View
            DrawingView(canvas: $canvas, isDraw: $isDraw, type: $type, color: $color)
                .navigationTitle("Drawing")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: {
                    // saving image
                    SaveImage()
                }, label: {
                    
                    Image(systemName: "pencil.tip.crop.circle.badge.plus")
                        .font(.headline)
                }), trailing: HStack(spacing: 15) {
                    
                    Button(action: {
                        
                        isDraw.toggle()
                        
                    }, label: {
                        Image(systemName: "pencil.tip.crop.circle.badge.minus")
                            .font(.headline)
                    })
                    
//                    Button(action: {
//
//                        isDraw = true
//                        type = .pencil
//
//                    }, label: {
//                        Image(systemName: "pencil")
//                    })
                    
//                    Button(action: {
//
//                        isDraw = true
//                        type = .marker
//
//                    }, label: {
//                        Image(systemName: "highlighter")
//                    })
//
//                    if #available(iOS 14.0, *) {
//                        ColorPicker(selection: $color) {
//
//                        }
//                    } else {
//                        // Fallback on earlier versions
//                    }
                }
                
                )
        }
    }
    
    func SaveImage() {
        let image = canvas.drawing.image(from: canvas.drawing.bounds, scale: 1)
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

struct DrawingView: UIViewRepresentable {
    
    @Binding var canvas : PKCanvasView
    @Binding var isDraw : Bool
    @Binding var type: PKInkingTool.InkType
    @Binding var color: Color
    
    let ink = PKInkingTool(.marker, color: .gray)
    
//    var ink: PKInkingTool {
//
//        PKInkingTool(type, color: UIColor(color))
//
//    }
    
    let eraser = PKEraserTool(.bitmap)
    
    func makeUIView(context: Context) -> PKCanvasView {
        
        if #available(iOS 14.0, *) {
            canvas.drawingPolicy = .anyInput
            canvas.tool = isDraw ? ink : eraser
            
        } else {
            // Fallback on earlier versions
        }
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        //
        
        uiView.tool = isDraw ? ink : eraser
    }
    

}
