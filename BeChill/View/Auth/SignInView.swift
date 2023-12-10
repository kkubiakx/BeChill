//
//  LoginView.swift
//  BabyGenderPrediction
//
//  Created by Krzysztof Kubiak on 13/10/2023.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                LogoNameView()
                    .shadow(radius: 6, x: 2, y: 10)
                    .frame(alignment: .center)

                Spacer()

                VStack {
                    VStack(alignment: .leading, spacing: 15) {
                        TextField("Email", text: self.$email)
                            .roundedFieldWithBorder()

                        SecureField("Password", text: self.$password)
                            .roundedFieldWithBorder()
                    }
                    .padding([.leading, .trailing], 27.5)

                    NavigationLink {
                        Text("Forgot password")
                    } label: {
                        Text("Forgot password?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top)
                            .padding(.trailing, 28)
                            .foregroundColor(Color.TextColor)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .frame(height: 40)

                    Button(action: {}) {
                        Text("Sign in")
                            .font(.headline)
                            .foregroundColor(Color.BackgroundColor)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.TextColor)
                            .cornerRadius(15.0)
                    }.padding(.top, 15)

                    Spacer()
                        .frame(height: 80)

                    NavigationLink(destination: SignUpView().navigationBarBackButtonHidden(true)) {
                        HStack {
                            Text("Don't have an account?")

                            Text("Sing up.")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        .font(.footnote)
                        .foregroundColor(.TextColor)
                    }
                    .padding(.bottom, 0)
                }
                .shadow(radius: 6, x: 4, y: 15)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(Color.BackgroundColor)
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()

    }
}
