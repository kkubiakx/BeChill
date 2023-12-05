//
//  LogoNameView.swift
//  BabyGenderPrediction
//
//  Created by Krzysztof Kubiak on 13/10/2023.
//

import SwiftUI

struct LogoNameView: View {
    var body: some View {
        Image("iosapptemplate")
            .resizable()
            .frame(width: 160, height: 160)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 4))
//            .shadow(radius: 10.0, x: 20, y: 10)
            .padding(.top, 50)

        Text("Name")
            .font(.largeTitle).foregroundColor(Color.black)
//            .font(Font.system(size: 36, design: .serif))
            .padding([.top, .bottom], 20)
//            .shadow(radius: 10.0, x: 20, y: 10)
    }
}

#Preview {
    LogoNameView().background(.gray)
}
