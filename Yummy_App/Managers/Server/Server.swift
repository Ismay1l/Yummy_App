//
//  ApiManager.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 07.03.23.
//

import Moya
import Foundation

enum Server {
    
    case dishCategories, popularDishes
}

extension Server: TargetType {
    
    var baseURL: URL {
        switch self {
        case .dishCategories:
            return URL(string: ApiConstants.categories.baseURL)!
        case .popularDishes:
            return URL(string: ApiConstants.popular.baseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .dishCategories: return "/categories"
        case .popularDishes: return "/popular"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .popularDishes, .dishCategories: return .get
        }
    }
    
    public var sampleData: Data {
        Data()
    }
    
    var task: Moya.Task {
        switch self {
        case .dishCategories, .popularDishes: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
