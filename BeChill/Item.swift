//
//  Item.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 27/11/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
