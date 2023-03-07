//
//  ApiConstants.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 07.03.23.
//

import Foundation

enum ApiConstants {
    
    case categories, popular
    
    var baseURL: String {
        switch self {
        case .categories:
            return "http://0.0.0.0:3000"
        case .popular:
            return "http://0.0.0.0:3001"
        }
    }
}
