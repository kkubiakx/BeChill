//
//  HotFeedView.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 03/12/2023.
//

import SwiftUI

struct HotFeedView: View {
    @Binding var tabState: Visibility

    var body: some View {
        TabStateScrollView(axis: .vertical, showsIndicator: false, tabState: $tabState) {
            LazyVStack {
                ForEach(0 ... 50, id: \.self) { post in
                    PostView(post: .constant(Post.mocks[0]))
                    Divider()
                }
            }
        }
    }
}

#Preview {
    HotFeedView(tabState: .constant(.visible))
}
