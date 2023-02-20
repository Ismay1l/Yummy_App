//
//  OnboardingView.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 20.02.23.
//

import UIKit

class OnboardingView: UIView {
    
    //MARK: - UI Elements
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.titleNextButton, for: .normal)
        button.setTitleColor(Asset.Colors.lightText.color, for: .normal)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: mediumFont!)
        button.backgroundColor = Asset.Colors.nextButtonBackground.color
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Functions
    private func setUpUI() {
        backgroundColor = Asset.Colors.background.color
        addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
