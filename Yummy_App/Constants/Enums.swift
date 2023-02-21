//
//  Enums.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 21.02.23.
//

import UIKit

enum CollectionViewIDs {
    
    case onboardingCell
    
    var description: String {
        switch self {
        case .onboardingCell:
            return "onboarding_cell"
        }
    }
}

enum Fonts {
    
    case medium22, medium25,
         regular22,
         semibold30
    
    var font: UIFont {
        switch self {
        case .medium22:
            return medium_22.isFontNil
        case .regular22:
            return regular_22.isFontNil
        case .semibold30:
            return semibold_30.isFontNil
        case .medium25:
            return medium_25.isFontNil
        }
    }
}

enum NotificationName {
    
    case backToWelcomeVC
    
    var message: String {
        switch self {
        case .backToWelcomeVC:
            return "User tapped back to WelcomeVC"
        }
    }
}
