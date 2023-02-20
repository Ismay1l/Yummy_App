//
//  OnboardingView.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 20.02.23.
//

import UIKit

class OnboardingView: UIView {
    
    //MARK: - UI Elements
    private lazy var nextButton: CapsuleButton = {
        let button = CapsuleButton(type: .system)
        button.setTitle(L10n.titleNextButton, for: .normal)
        button.setTitleColor(Asset.Colors.lightText.color, for: .normal)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: medium.isFontMedium)
        button.backgroundColor = Asset.Colors.nextButtonBackground.color
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = Asset.Colors.pageControlCurrent.color
        pageControl.pageIndicatorTintColor = Asset.Colors.pageControlTintColor.color
        pageControl.backgroundStyle = .minimal
        pageControl.direction = .leftToRight
        pageControl.allowsContinuousInteraction = true
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.Colors.background.color
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Functions
    private func setUpUI() {
        addSubview(nextButton)
        addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            
            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
