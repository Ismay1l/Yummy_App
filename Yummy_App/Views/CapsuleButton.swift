//
//  CapsuleButton.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 20.02.23.
//

import UIKit

class CapsuleButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let height = bounds.height
        layer.cornerRadius = height/2
      }
}
