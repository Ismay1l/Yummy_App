//
//  DetailView.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 07.03.23.
//

import UIKit

class DetailView: UIView {
    
    private lazy var nameLabel = createLabel(with: Asset.Colors.blackLabel.color, fontName: .medium20, numberOfLines: 1, textAlignment: .left)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.Colors.background.color
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Functions
    private func setupUI() {}
}
