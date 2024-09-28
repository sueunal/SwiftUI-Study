//
//  Item.swift
//  SwiftUI-Study
//
//  Created by sueun kim on 4/24/24.
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
