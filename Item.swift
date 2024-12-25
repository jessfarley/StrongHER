//
//  Item.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
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
