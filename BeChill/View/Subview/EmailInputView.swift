//
//  SwiftUIView.swift
//  BabyGenderPrediction
//
//  Created by Krzysztof Kubiak on 13/10/2023.
//

import SwiftUI

struct EmailInputView: View {
    @Binding var email: String
    @Binding var password: String
    var buttonText: String

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 15) {
                TextField("Email", text: self.$email)
                    .padding()
                    .background(.white.opacity(0.7))
                    .cornerRadius(15.0)
    //                    .shadow(radius: 10.0, x: 20, y: 10)
                    .foregroundColor(.black)

                SecureField("Password", text: self.$password)
                    .padding()
                    .background(.white.opacity(0.7))
                    .cornerRadius(15.0)
                    .foregroundColor(.black)
    //                    .shadow(radius: 10.0, x: 20, y: 10)
            }
            .padding([.leading, .trailing], 27.5)
            
            Button(action: {}) {
                Text(buttonText)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(LinearGradient(
                        gradient: Gradient(colors: [.pink, .blue]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                        ))
                    .cornerRadius(15.0)
    //                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding(.top, 30)
        }
    }
}

struct EmailInputView_Previews: PreviewProvider {
    static var previews: some View {
        EmailInputView(email: .constant("email@icloud.com"), password: .constant("password"), buttonText: "heyy")
            .background(LinearGradient(
                gradient: Gradient(colors: [.pink, .blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                .padding(.all, 0))
    }
}
