//
//  ProfileView.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 03/12/2023.
//

import SwiftUI

struct ProfileView: View {
    @Binding var user: User
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 1)
            Divider()
                .background(Color.TextColor)
            HStack(alignment: .top) {
                Image("shane-gillis")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.TextColor, lineWidth: 1))

                Spacer()
                    .frame(width: 20)

                VStack(alignment: .leading) {
                    Text("\(user.name)")
                        .bold()
                        .font(.system(size: 20))
                    Text("@\(user.handle)")
                        .font(.system(size: 15))
                        .italic()

                    Spacer()
                        .frame(height: 10)

                    Text("\(user.bio)")

                    Spacer()
                }
                .frame(height: 100, alignment: .leading)

                Spacer()
            }
            .frame(maxHeight: 120)
            .padding(10)

            Divider()
            .background(Color.TextColor)

            Text("Posts")
                .font(.title)
                .bold()

//            Text("\(user.posts[0].content)")
            ForEach(Post.mocks, id: \.self) { post in
                PostView(post: .constant(post))
            }
            Spacer()
        }
        .foregroundStyle(Color.TextColor)
    }
}

#Preview {
    ProfileView(user: .constant(User.mocks[0]))
}
