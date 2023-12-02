//
//  SignupOverlayView.swift
//  BabyGenderPrediction
//
//  Created by Krzysztof Kubiak on 13/10/2023.
//

import SwiftUI

struct SignInOverlayView: View {
    @Binding var email: String
    @Binding var password: String

    var body: some View {
        VStack {
            LogoNameView()
                .shadow(radius: 6, x: 2, y: 10)


            Spacer()

            EmailInputView(email: $email, password: $password, buttonText: "Sign in")
                .shadow(radius: 12, x: 4, y: 25)

            Spacer()
                .frame(height: 120)


            NavigationLink(destination: SignUpView()) {
                HStack {
                    Text("Don't have an account?")

                    Text("Sing up.")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .font(.footnote)
                .foregroundColor(.black)

                .shadow(radius: 6, x: 4, y: 10)
            }
        }
//        .navigationTitle("Sign in")
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
//        .padding(.horizontal, )
    }
}
struct SignupOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        SignInOverlayView(email: .constant("email@icloud.com"), password: .constant("password"))
            .background(.yellow)
    }
}
