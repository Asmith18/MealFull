//
//  Food.Controller.swift
//  MealFull
//
//  Created by adam smith on 1/17/22.
//

import Foundation
import UIKit
//Singleton!!!!!!!!!
class FoodController{
    // shared = shared instances
    static let shared = FoodController()
    // our list of foods
    var listOfFoods: [Food] = []
    
    func creat(name: String) {
        let newFood = Food(name: name)
        listOfFoods.append(newFood)
        
    }
    
    func delete(food: Food) {
        guard let index = listOfFoods.firstIndex(where: { $0 == food }) else { return }
        listOfFoods.remove(at: index)
    }
}
