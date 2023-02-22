//
//  Enums.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 21.02.23.
//

import UIKit

//MARK: CollectionViewIDs
enum CollectionViewCellIDs {
    
    case onboarding, foodCategory, popularDishes, chefsSpecial, header
    
    var identifier: String {
        switch self {
        case .onboarding:
            return "onboarding_cell"
        case .foodCategory:
            return "foodCategory_cell"
        case .popularDishes:
            return "popularDishes_cell"
        case .chefsSpecial:
            return "chefsSpecial_cell"
        case .header:
            return "header_cell"
        }
    }
}

//MARK: Fonts
enum Fonts {
    
    case medium20, medium22, medium25,
         regular16, regular18, regular20,
         semibold30
    
    var font: UIFont {
        switch self {
        case .medium22:
            return medium_22.isFontNil
        case .regular20:
            return regular_20.isFontNil
        case .semibold30:
            return semibold_30.isFontNil
        case .medium25:
            return medium_25.isFontNil
        case .regular16:
            return regular_16.isFontNil
        case .medium20:
            return medium_20.isFontNil
        case .regular18:
            return regular_18.isFontNil
        }
    }
}

//MARK: NotificationName
enum NotificationName {
    
    case backToWelcomeVC
    
    var message: String {
        switch self {
        case .backToWelcomeVC:
            return "User tapped back to WelcomeVC"
        }
    }
}

//MARK: - CollectionVewHeaderView
enum CollectionVewHeaderType {
    case foodCategory, popularDishes, chefsSpecial
    
    var title: String {
        switch self {
        case .foodCategory:
            return L10n.titleFoodCategoryCell
        case .popularDishes:
            return L10n.titlePopularDishesCell
        case .chefsSpecial:
            return L10n.titleChefsSpecialCell
        }
    }
}
