//
//  Post.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 29/11/2023.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Post {
    var content: String
    var id: UUID
    var user: String
    var dateCreated: Date
    var likes: Int
    //    var profilePicture: Image

    init(_ content: String, user: String) {
        self.id = UUID()
        self.content = String(content.prefix(100))
        self.user = user
        self.dateCreated = Date()
        self.likes = 0
        //        self.profilePicture = profilePicture
    }
}

extension Post {
    static var mocks: [Post] = [
        Post("Australians are funny Australians are funny Australians are funny Australians are funny Australians are funny Australians are funny", user: "Shane Gillis")
    ]
}
