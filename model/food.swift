//
//  food.swift
//  MealFull
//
//  Created by adam smith on 1/17/22.
//

import Foundation
// interactive lecture: singleton???
class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Food: Equatable {
    static func == (lhs: Food, rhs: Food) -> Bool {
        return lhs.name == rhs.name
    }
    
    
}
