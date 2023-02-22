//
//  FoodCategoryCell.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 22.02.23.
//

import UIKit
import Kingfisher

class FoodCategoryCell: UICollectionViewCell {
    
    //MARK: - UI Elements
    private lazy var titleLabel = createLabel(with: Asset.Colors.blackLabel.color, fontName: .medium22, numberOfLines: 0, textAlignment: .center)
    
    private lazy var foodImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        contentView.addSubview(foodImage)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            foodImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            foodImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            foodImage.heightAnchor.constraint(equalToConstant: contentView.frame.size.height - 10),
            foodImage.widthAnchor.constraint(equalToConstant: contentView.frame.size.height - 10),
            
            titleLabel.leftAnchor.constraint(equalTo: foodImage.rightAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            
        ])
    }
    
    func setupCell(with item: FoodCategory) {
        titleLabel.text = item.name
        foodImage.kf.setImage(with: item.image.isEmptyOrNil.asURL)
    }
}
