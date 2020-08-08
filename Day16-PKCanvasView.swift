//
//  ContentView.swift
//  Pencil
//
//  Created by Dali Han on 2020/8/4.
//  Copyright © 2020 Dali Han. All rights reserved.
//  Credit to Kavsoft
//  Link: https://www.youtube.com/watch?v=LR-ttBoa89M

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

struct  Home: View {
    @State var canvas = PKCanvasView()
    @State var isDraw = true
    @State var color: Color = .black
    @State var type: PKInkingTool.InkType = .pencil
    @State var colorPicker = false
    
    var body: some View {
        NavigationView {
            DrawingView(canvas: $canvas, isDraw: $isDraw, type: $type, color: $color)
                .navigationTitle("Drawing")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: {
                    // saving images
                }) {
                    Image(systemName: "square.and.arrow.down.fill")
                        .font(.title)
                }, trailing: HStack(spacing: 15) {
                    Button(action: {
                        // eraser tool
                        isDraw = false
                    }) {
                        Image(systemName: "pencil.tip.crop.circle.badge.minus")
                            .font(.title)
                    }
                    
                    // Menu
                    
                    Menu {
                        Button(action: {
                            colorPicker.toggle()
                        }) {
                            Label {
                                Text("Color")
                            } icon: {
                                Image(systemName: "eyedropper.halffull")
                            }
                        }
                        
                        Button(action: {
                            isDraw = true
                            type = .pencil
                        }) {
                            Label {
                                Text("Pencil")
                            } icon: {
                                Image(systemName: "pencil")
                            }
                        }
                        
                        Button(action: {
                            
                            isDraw = true
                            type = .pen
                            
                        }) {
                            Label {
                                Text("Pen")
                            } icon: {
                                Image(systemName: "pencil.tip")
                            }
                        }
                        
                        Button(action: {
                            isDraw = true
                            type = .marker
                        }) {
                            Label {
                                Text("Marker")
                            } icon: {
                                Image(systemName: "highlighter")
                            }
                        }
                        
                    } label: {
                        Image(systemName: "pencil")
                            .resizable()
//                            .frame(width: 25, height: 25)
                    }
                })
                .sheet(isPresented: $colorPicker) {
                    ColorPicker("Pick a Color", selection: $color)
                }
        }.padding()
    }
    
    func SaveImage() {
        let image = canvas.drawing.image(from: canvas.drawing.bounds, scale: 1)
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}
struct DrawingView : UIViewRepresentable {
    
    @Binding var canvas : PKCanvasView
    @Binding var isDraw : Bool
    @Binding var type : PKInkingTool.InkType
    @Binding var color : Color
    
    var ink: PKInkingTool {
        PKInkingTool(type, color: UIColor(color))
    }
    
    let eraser = PKEraserTool(.bitmap)
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = .anyInput
        canvas.tool = isDraw ? ink : eraser
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        uiView.tool = isDraw ? ink : eraser
    }
}
