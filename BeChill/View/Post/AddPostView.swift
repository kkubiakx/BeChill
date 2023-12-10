//
//  AddPostView.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 10/12/2023.
//

import SwiftUI

struct AddPostView: View {
//    @Binding var post: Post


    @State private var postText = ""
    @State private var textEditorHeight: CGFloat = Constants.MIN_TEXT_EDITOR_HEIGHT
    @Binding var isPresented: Bool

    let maxCharacters = 80

    var body: some View {
        VStack(alignment: .center) {
            Text("Your post for " + Date().formatted())
                .font(.headline)
                .foregroundStyle(Color.TextColor)
                .padding(.bottom, 10)

            GeometryReader { geometry in
                TextEditor(text: $postText)
                    .frame(height: max(textEditorHeight, Constants.MIN_TEXT_EDITOR_HEIGHT))
                    .onChange(of: postText) {
                        // Limit the character count
                        if postText.count > maxCharacters {
                            let index = postText.index(postText.startIndex, offsetBy: maxCharacters)
                            postText = String(postText.prefix(upTo: index))
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))

            }
            .frame(height: textEditorHeight)
            .onChange(of: postText) {
                let newSize = postText.heightWithConstrainedWidth(width: UIScreen.main.bounds.width - 32, font: UIFont.preferredFont(forTextStyle: .body))
                textEditorHeight = max(newSize, Constants.MIN_TEXT_EDITOR_HEIGHT)
            }

            HStack {
                Spacer()
                Text("\(postText.count)/\(maxCharacters)")
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                    .foregroundColor(.TextColor)
//                    .background(.thickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .offset(x: 5, y: -5)
            }
            .padding(.trailing, 5)

            Button(action: {
                Post.mocks.append(Post(postText, user: User.mocks[0].name))
                isPresented = false
            }) {
                Text("Post")
                    .font(.headline)
                    .foregroundColor(Color.BackgroundColor)
                    .padding()
                    .frame(width: 150, height: 40)
                    .background(Color.TextColor)
                    .cornerRadius(15.0)
            }
        }
        .padding()
        .presentationBackground(.thinMaterial)
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView(isPresented: .constant(true))
            .background(.gray)

    }
}
