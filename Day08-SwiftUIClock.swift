//
//  ContentView.swift
//  SwiftUIClock
//
//  Created by Dali Han on 2020/5/27.
//  Copyright © 2020 Dali Han. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var date = Date()
    
    var body: some View {
        VStack {
            
            Text("\(monthString(date: date))")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.gray)
            
            Text("\(timeString(date: date))")
                .onAppear(perform: {let _ = self.updateTimer}) // refresh the time every seconds
                .font(.system(size: 55, weight: .semibold))
                .padding(.all, 10)
        }
    }
    
    // MARK: -- Time format
    
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        return formatter
    }
    
    func timeString(date: Date) -> String {
        let time = timeFormat.string(from: date)
        return time
    }
    
    // refresh time func
    var updateTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in self.date = Date()})
    }
    
    // MARK: -- Date Format in Chinese
    
    var monthFormat: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "zh_CN")
        formatter.setLocalizedDateFormatFromTemplate("MMMMd")
        return formatter
    }
    
    func monthString(date: Date) -> String {
        let month = monthFormat.string(from: date)
        return month
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
