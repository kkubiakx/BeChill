//
//  SignUpView.swift
//  BabyGenderPrediction
//
//  Created by Krzysztof Kubiak on 13/10/2023.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {

        NavigationStack {
            VStack {
                Spacer()

                LogoNameView()
                    .shadow(radius: 6, x: 2, y: 10)

                Spacer()

                VStack {
                    VStack(alignment: .leading, spacing: 15) {
                        TextField("Email", text: self.$email)
                            .roundedFieldWithBorder(opacity: 1)
                        //

                        SecureField("Password", text: self.$password)
                            .roundedFieldWithBorder()
                    }
                    .padding([.leading, .trailing], 27.5)

                    Spacer()
                        .frame(height: 40)

                    Button(action: {}) {
                        Text("Sign up")
                            .font(.headline)
                            .foregroundColor(.BackgroundColor)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.TextColor)
                            .cornerRadius(15.0)
                    }.padding(.top, 15)
                }
                .shadow(radius: 6, x: 4, y: 15)



                Spacer()
                    .frame(height: 80)


                Button (action: {dismiss()}) {
                    HStack {
                        Text("Already have an account?")

                        Text("Sing in.")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .font(.footnote)
                    .foregroundColor(.TextColor)

                    .shadow(radius: 6, x: 4, y: 10)
                }
                .padding(.bottom, 0)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(Color.BackgroundColor)
        }
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
