//
//  Route.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 29/11/2023.
//

import Foundation

enum Route: Hashable {
    case post(post: Post)

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.post(let lhsPost), .post(let rhsPost)):
            return lhsPost.id == rhsPost.id
        }
    }
}
