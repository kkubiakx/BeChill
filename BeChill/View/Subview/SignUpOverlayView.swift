//
//  SignUpOverlayView.swift
//  BabyGenderPrediction
//
//  Created by Krzysztof Kubiak on 13/10/2023.
//

import SwiftUI

struct SignUpOverlayView: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var firstname: String
    @Binding var birth: Date

    var body: some View {
        VStack {
            LogoNameView()
                .shadow(radius: 6, x: 2, y: 10)

            Spacer()

            VStack(alignment: .leading, spacing: 15) {
                TextField("First name", text: self.$firstname)
                    .padding()
                    .background(.white.opacity(0.7))
                    .cornerRadius(15.0)
                    .foregroundColor(.black)

                TextField("Email", text: self.$email)
                    .padding()
                    .background(.white.opacity(0.7))
                    .cornerRadius(15.0)
                    .foregroundColor(.black)

                SecureField("Password", text: self.$password)
                    .padding()
//                    .background(.white.opacity(0.7))
                    .background(Blur())
                    .cornerRadius(15.0)
                    .foregroundColor(.black)
            }
            .padding([.leading, .trailing], 27.5)

            
            Spacer()

            Button(action: {}) {
                Text("Sign up")
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
            }
            .padding(.bottom, 30)

            Spacer()
                .frame(height: 120)

            HStack {
                Text("Already have an account?")

                Text("Sign in.")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

            }
            .font(.footnote)
            .foregroundColor(.black)
            .shadow(radius: 6, x: 4, y: 10)



        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .navigationTitle("Sign up")
        .background(.ultraThinMaterial)


    }
}

struct SignUpOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpOverlayView(email: .constant("email@icloud.com"), password: .constant("password"), firstname: .constant("Krzyś"), birth: .constant(Date()))
            .background(.yellow)
    }
}
