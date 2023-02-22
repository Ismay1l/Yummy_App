//
//  PopularDishesCell.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 22.02.23.
//

import UIKit

class PopularDishesCell: UICollectionViewCell {
    
    //MARK: - UI Elements
    private lazy var titleLabel = createLabel(with: Asset.Colors.blackLabel.color, fontName: .medium20, numberOfLines: 0, textAlignment: .center)
    private lazy var caloryLabel = createLabel(with: Asset.Colors.red.color, fontName: .regular18, numberOfLines: 1, textAlignment: .left)
    private lazy var descriptionLabel = createLabel(with: Asset.Colors.systemGray.color, fontName: .regular16, numberOfLines: 1, textAlignment: .left)
    
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
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            foodImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            foodImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            foodImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            foodImage.bottomAnchor.constraint(equalTo: caloryLabel.topAnchor, constant: -1),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            caloryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            caloryLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -1)
        ])
    }
    
    func setupCell(with dish: Dish) {
        titleLabel.text = dish.name
        foodImage.kf.setImage(with: dish.image.isEmptyOrNil.asURL)
        caloryLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }
}
