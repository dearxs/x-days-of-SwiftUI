//
//  LoadingView.swift
//
//  Created by Dali Han on 2020/7/28.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(filename: "chat").frame(width: 300, height: 300)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
