//
//  PostVieew.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 02/12/2023.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack {
            Text("Test")
            HStack {
                Text("Author")

                Text("Date")
                Text("Likes")
            }.frame(width: .infinity)
        }
        .frame(width: .infinity, height: 240)
        .background(Color.BackgroundColor)
        .padding(.horizontal, 5)
    }
}

#Preview {
    PostView()
}
