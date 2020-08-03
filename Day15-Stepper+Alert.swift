//
//  ContentView.swift
//  BetterRest
//
//  Created by Dali Han on 2020/8/3.
//  Copyright © 2020 Dali Han. All rights reserved.
//  Credit: Paul Hudson
//  Link: https://www.hackingwithswift.com/books/ios-swiftui/betterrest-introduction

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var showAlert = false
    @State private var alertTitle = "Alert Title"
    @State private var alertMsg = "Alert Msg Content"
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily Coffee intake")
                        .font(.headline)
                    
                    Stepper(value: $coffeeAmount, in: 1...20) {
                        if coffeeAmount == 1 {
                            Text("1 cup")
                        } else {
                            Text("\(coffeeAmount) cups")
                        }
                    }
                }
                
                Button("Alert") {
                    self.showAlert.toggle()
                }
            }
            .navigationBarTitle("Better Sleep")
            .navigationBarItems(trailing:
                Button(action: {
                    print("Button Tapped")
                }) {
                    Text("Calculate")
            })
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMsg), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
