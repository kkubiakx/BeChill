//
//  FeedView.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 02/12/2023.
//

import SwiftUI

struct FeedView: View {
    @State private var showTitle = true

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(0 ... 50, id: \.self) { post in
                        PostView(post: .constant(Post.mocks[0]))
                        Divider()
                    }
                }
            }
            .background(Color.BackgroundColor, ignoresSafeAreaEdges: .all)
            .navigationTitle("Feed")

        }
    }
}

#Preview {
    FeedView()
}
