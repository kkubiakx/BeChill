//
//  User.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 03/12/2023.
//

import Foundation
import SwiftData

@Model
class User {
    var id: UUID
    var email: String
    var handle: String
    var name: String
    var bio: String
    var posts: [Post]

    init(id: UUID = UUID(), email: String, handle: String, bio: String = "", posts: [Post] = [], name: String?) {
        self.id = id
        self.email = email
        self.handle = handle
        self.bio = bio
        self.posts = posts
        self.name = name ?? handle
    }

    func addPost(_ post: Post) {
        self.posts.append(post)
    }
}

extension User {
    static var mocks: [User] = [
        User(email: "shanegillis@email.com", handle: "shaaaaane", bio: "Comedian. President. Father.", posts: [Post("Heyyyy", user: "shne")], name: nil)
    ]
}
