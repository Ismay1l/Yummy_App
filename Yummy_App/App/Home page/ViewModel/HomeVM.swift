//
//  HomePageVM.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 07.03.23.
//

import Foundation
import Moya

struct HomeVM {
    
    static let shared = HomeVM()
    private init() {}
    
    let provider = MoyaProvider<Server>()
    
    func getCategories(_ completion: @escaping ((Category) -> Void)) {
        provider.request(.dishCategories) { result in
            switch result {
            case .success(let response):
                do {
                    let categories = try response.map(Category.self)
                    completion(categories)
                } catch {
                    assertionFailure()
                }
            case .failure:
                assertionFailure()
            }
        }
    }
    
    func getPopularDishes(_ completion: @escaping ((Category) -> Void)) {
        provider.request(.popularDishes) { result in
            switch result {
            case .success(let response):
                do {
                    let popular = try response.map(Category.self)
                    completion(popular)
                } catch {
                    assertionFailure()
                }
            case .failure:
                assertionFailure()
            }
        }
    }
}


struct Category: Codable {
    let cateories: [String]
}

