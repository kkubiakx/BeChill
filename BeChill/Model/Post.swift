//
//  Post.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 29/11/2023.
//

import Foundation
import SwiftData

@Model
final class Post {
    var content: String
    var id: UUID

    init(_ content: String) {
        self.content = content
        self.id = UUID()
    }

    static var mocks: [Post] = [Post("1"), Post("2")]
}
