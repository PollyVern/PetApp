//
//  Item.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 23.01.2025.
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
