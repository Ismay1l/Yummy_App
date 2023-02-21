//
//  Functions.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 21.02.23.
//

import UIKit

func createLabel(with textColor: UIColor, fontName: Fonts, numberOfLines: Int, textAlignment: NSTextAlignment) -> UILabel {
    let label = UILabel()
    label.textColor = textColor
    label.adjustsFontForContentSizeCategory = true
    label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: fontName.font)
    label.textAlignment = textAlignment
    label.numberOfLines = numberOfLines
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}
