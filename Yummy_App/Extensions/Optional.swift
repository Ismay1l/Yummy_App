//
//  UIFont.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 20.02.23.
//

import UIKit

extension Optional where Wrapped == UIFont {
    
    var isFontMedium: UIFont {
        self ?? UIFont.systemFont(ofSize: 22, weight: .medium)
    }
}
