//
//  PopularDish.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 22.02.23.
//

import Foundation

struct Dish {
    
    let id, name, description, image: String?
    let calories: Double?
    
    var formattedCalories: String {
        String(format: "%.1f calories", calories.isEmptyOrNil)
    }
}
