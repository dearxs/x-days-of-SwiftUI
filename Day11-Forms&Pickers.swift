//
//  ContentView.swift
//  Tutorial
//
//  Created by Dali Han on 2020/7/24.
//  Copyright © 2020 Dali Han. All rights reserved.
//  Credit to Jeroen Zonneveld: https://zonneveld.dev/swiftui-form/

import SwiftUI

struct ContentView: View {
    
    @State private var name : String = ""
    @State private var age : String = ""
    
    @State private var selectedGenderIndex: Int = 0
    private var genderOptions = ["🤦‍♂️", "🤦‍♀️", "🤖"]
    
    @State private var birthday = Date()
    
    @State private var acceptedTerms: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Form {
                    
                    Section(header: Text("Personal")) {
                        TextField("Your name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Your age", text: $age).keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    Section(header: Text("Details")) {
                        // Picker
                        Picker("Gender", selection: $selectedGenderIndex) {
                            ForEach( 0 ..< genderOptions.count ) {
                                Text(self.genderOptions[$0])
                            }
                        } // .pickerStyle(SegmentedPickerStyle())
                        
                        // DatePicker
                        DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date) {
                            Text("Birthday")
                        }// .datePickerStyle(WheelDatePickerStyle())
                    }
                    
                    // Toggle
                    Toggle("I agree to the terms&conditions", isOn: $acceptedTerms)
                        .toggleStyle(SwitchToggleStyle())
                
            }
                Button("Submit") { print("Submitting info ...") }
                Spacer()
                
            }.navigationBarTitle("Personal Information")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




