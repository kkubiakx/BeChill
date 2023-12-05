//
//  PostVieew.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 02/12/2023.
//

import SwiftUI

struct PostView: View {
    @Binding var post: Post

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("shane-gillis")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .frame(maxWidth: 40, alignment: .topLeading)

                Text(post.content)
                    .italic()
                    .frame(maxWidth: .infinity, maxHeight: 80, alignment: .topLeading)
                    .font(.system(size: 17))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 5)
            }
            .padding(.top, 5)
            .padding(.horizontal, 10)

            Spacer()
                .frame(height: 10)

            HStack {
                Text("~ " + post.user)
                    .bold()
                    .frame(alignment: .bottom)
                Text(post.dateCreated.formatted())
                    .font(.footnote)

                Spacer()

                Button(action: {}) {
                    Image(systemName: "heart")
                }

                Spacer()
                    .frame(width: 10)
                
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
            .padding(.bottom, 5)
            .padding(.horizontal, 10)

        }
        .frame(maxWidth: .infinity, maxHeight: 120)
        .background(Color.BackgroundColor)
        .tint(.black)
        .foregroundStyle(Color.TextColor)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: .constant(Post.mocks[0]))
    }
}
