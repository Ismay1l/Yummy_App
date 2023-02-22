//
//  ChefsSpecialCell.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 22.02.23.
//

import UIKit

class ChefsSpecialCell: UICollectionViewCell {
    
    //MARK: - UI Elements
    private lazy var titleLabel = createLabel(with: Asset.Colors.blackLabel.color, fontName: .medium22, numberOfLines: 0, textAlignment: .center)
    private lazy var caloryLabel = createLabel(with: Asset.Colors.red.color, fontName: .regular20, numberOfLines: 1, textAlignment: .left)
    private lazy var descriptionLabel = createLabel(with: Asset.Colors.systemGray.color, fontName: .regular18, numberOfLines: 1, textAlignment: .left)
    
    private lazy var foodImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 10
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(foodImage)
        contentView.addSubview(caloryLabel)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            foodImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            foodImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            foodImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            foodImage.widthAnchor.constraint(equalToConstant: contentView.frame.size.height - 16),
            
            titleLabel.topAnchor.constraint(equalTo: foodImage.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: foodImage.rightAnchor, constant: 8),
            
            caloryLabel.bottomAnchor.constraint(equalTo: foodImage.bottomAnchor),
            caloryLabel.leftAnchor.constraint(equalTo: foodImage.rightAnchor, constant: 8),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: foodImage.centerYAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: foodImage.rightAnchor, constant: 8),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5)
        ])
    }
    
    func setupCell(with dish: Dish) {
        titleLabel.text = dish.name
        foodImage.kf.setImage(with: dish.image.isEmptyOrNil.asURL)
        caloryLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }
}
