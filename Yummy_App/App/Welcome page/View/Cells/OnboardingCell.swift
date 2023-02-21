//
//  OnboardingCell.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 21.02.23.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    private lazy var titleLabel = createLabel(with: Asset.Colors.blackLabel.color, fontName: .semibold30, numberOfLines: 0, textAlignment: .left)
    
    private lazy var slideImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionLabel = createLabel(with: Asset.Colors.blackLabel.color, fontName: .medium25, numberOfLines: 0, textAlignment: .center)
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Parent Delegate
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.Colors.background.color
        setupUI()
    }
    
    //MARK: Functions
    private func setupUI() {
        contentView.addSubview(slideImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            slideImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            slideImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            slideImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            slideImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2),
            
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: slideImage.bottomAnchor),
            
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
//            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setUpCell(with slide: OnboardingSlide) {
        slideImage.image = slide.image
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
    }
}
