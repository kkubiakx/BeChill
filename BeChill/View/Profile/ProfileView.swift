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
        VStack (alignment: .leading) {
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
                    .frame(width: 10)

                VStack(alignment: .leading) {
                    HStack {
                        VStack {
                            Text("\(user.name)")
                                .bold()
                            .font(.system(size: 20))
                            Text("@\(user.handle)")
                                .font(.system(size: 15))
                                .italic()
                        }
                        Spacer()
                        Button(action: {}) {
                            Text("Follow")
                                .padding(.vertical, 2)
                                .padding(.horizontal, 15)
                                .overlay {
                                    RoundedRectangle(cornerSize: CGSize(width: 30, height: 30)).stroke( Color.TextColor, lineWidth: 1)
                                }
                        }
                    }

                    Spacer()
                        .frame(height: 10)

                    Text("\(user.bio)")

                    Spacer()
                }
                .frame(height: 100, alignment: .leading)

            }
            .frame(maxHeight: 120)
            .padding(.horizontal, 10)

            Divider()
            .background(Color.TextColor)


            Text("Posts")
                .font(.title)
            .bold()
            .padding(10)


//            Text("\(user.posts[0].content)")
            ForEach(Post.mocks, id: \.self) { post in
                Text("\(post.dateCreated.formatted())")
                    .padding(.leading, 10)
                    .font(.headline)
                PostView(post: .constant(post))
                
            }
            Spacer()
        }
        .foregroundStyle(Color.TextColor)
        .background(Color.BackgroundColor)
    }
}

#Preview {
    ProfileView(user: .constant(User.mocks[0]))
}
