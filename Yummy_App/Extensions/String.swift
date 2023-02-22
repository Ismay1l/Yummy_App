//
//  String.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 22.02.23.
//

import Foundation

extension String {
    
    var asURL: URL? {
        URL(string: self)
    }
}
