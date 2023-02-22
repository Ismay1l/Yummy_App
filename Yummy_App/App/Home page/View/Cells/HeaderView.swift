//
//  HeaderView.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 22.02.23.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    //MARK: - UI Elements
    private lazy var titleLabel = createLabel(with: Asset.Colors.blackLabel.color, fontName: .regular22, numberOfLines: 0, textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.Colors.background.color
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Functions
    private func setupUI() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
    
    func setupHeader(with title: String) {
        titleLabel.text = title
    }
}
