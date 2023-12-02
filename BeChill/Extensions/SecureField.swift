//
//  SecureField.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 29/11/2023.
//

import Foundation
import SwiftUI


extension View {
    func roundedFieldWithBorder(cornerRadius: CGFloat = 15, backgroundColor: Color = .white, foregroundColor: Color = .black, borderColor: Color = .black, borderWidth: CGFloat = 1, opacity: CGFloat = 1) -> some View {
        self.padding()
            .background(.thinMaterial.opacity(opacity))
            .cornerRadius(cornerRadius)
            .foregroundColor(Color.TextColor)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.TextColor.opacity(1), lineWidth: borderWidth)
            )
            .autocorrectionDisabled(true)
            .autocorrectionDisabled(true)
    }
}

