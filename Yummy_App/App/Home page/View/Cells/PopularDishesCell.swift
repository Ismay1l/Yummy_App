//
//  PopularDishesCell.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 22.02.23.
//

import UIKit

class PopularDishesCell: UICollectionViewCell {
    
    //MARK: - UI Elements
    private lazy var titleLabel = createLabel(with: Asset.Colors.blackLabel.color, fontName: .regular22, numberOfLines: 0, textAlignment: .center)
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Parent Delegate
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = Asset.Colors.lightGray.color
        setupUI()
    }
    
    //MARK: Functions
    private func setupUI() {
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setupCell(with title: String) {
        titleLabel.text = title
    }
}
