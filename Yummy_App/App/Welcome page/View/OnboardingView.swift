//
//  OnboardingView.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 20.02.23.
//

import UIKit

protocol OnboardingViewDelegate: AnyObject {
    func didTapGetStarted()
}

class OnboardingView: UIView {
    
    weak var delegate: OnboardingViewDelegate?
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            if currentPage == slides.count - 1 || currentPage >= slides.count {
                setButtonTitle(nextButton, text: L10n.titleNextButtonDidSet)
            } else {
                setButtonTitle(nextButton, text: L10n.titleNextButton)
            }
        }
    }
    
    //MARK: - UI Elements
    private lazy var nextButton: CapsuleButton = {
        let button = CapsuleButton(type: .system)
        setButtonTitle(button, text: L10n.titleNextButton)
        button.setTitleColor(Asset.Colors.lightText.color, for: .normal)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: Fonts.medium22.font)
        button.backgroundColor = Asset.Colors.nextButtonBackground.color
        button.addTarget(self, action: #selector(didTapNext(_:)), for: .touchUpInside)
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
        pageControl.isUserInteractionEnabled = false
        pageControl.allowsContinuousInteraction = true
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = Asset.Colors.background.color
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        
        view.register(OnboardingCell.self, forCellWithReuseIdentifier: CollectionViewIDs.onboardingCell.description)
        
        view.dataSource = self
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.Colors.background.color
        setUpUI()
        populateSlides()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Functions
    private func setUpUI() {
        addSubview(collectionView)
        addSubview(nextButton)
        addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -20),
            
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            
            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func populateSlides() {
        slides = [
            OnboardingSlide(title: L10n.titleSlide1, description: L10n.descriptionSlide1, image: Asset.Media.slide1.image),
            OnboardingSlide(title: L10n.titleSlide2, description: L10n.descriptionSlide2, image: Asset.Media.slide2.image),
            OnboardingSlide(title: L10n.titleSlide3, description: L10n.descriptionSlide3, image: Asset.Media.slide3.image),
        ]
    }
    
    private func setButtonTitle(_ sender: UIButton, text: String) {
        sender.setTitle(text, for: .normal)
    }
    
    @objc
    private func didTapNext(_ sender: UIButton) {
        currentPage += 1
        if currentPage <= slides.count - 1 {
            let index = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: index,
                                        at: .centeredHorizontally,
                                        animated: true)
        } else {
            delegate?.didTapGetStarted()
        }
    }
}

extension OnboardingView: UICollectionViewDelegate,
                          UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewIDs.onboardingCell.description, for: indexPath) as! OnboardingCell
        let slide = slides[indexPath.row]
        cell.setUpCell(with: slide)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
        currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width,
                      height: collectionView.frame.size.height)
    }
}
