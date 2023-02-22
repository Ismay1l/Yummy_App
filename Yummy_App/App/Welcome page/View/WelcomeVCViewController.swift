//
//  WelcomeVCViewController.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 20.02.23.
//

import UIKit

class WelcomeVC: UIViewController {
    
    //MARK: - UI Elements
    private lazy var onboardingView: OnboardingView = {
        let view = OnboardingView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Parent Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutViews()
        addNotificationObserver()
        setBackButton()
    }
    
    //MARK: - Functions
    private func layoutViews() {
        view.addSubview(onboardingView)
        
        NSLayoutConstraint.activate([
            onboardingView.topAnchor.constraint(equalTo: safeTop),
            onboardingView.leftAnchor.constraint(equalTo: safeLeft),
            onboardingView.rightAnchor.constraint(equalTo: safeRight),
            onboardingView.bottomAnchor.constraint(equalTo: safeBottom),
        ])
    }
    
    private func addNotificationObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(receiveNotification),
                                               name: NSNotification.Name(NotificationName.backToWelcomeVC.message),
                                               object: nil)
    }
    
    @objc
    private func receiveNotification() {
        onboardingView.currentPage = 0
        let index = IndexPath(item: onboardingView.currentPage, section: 0)
        onboardingView.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
}

//MARK: - Extension
extension WelcomeVC: OnboardingViewDelegate {
    
    func didTapGetStarted() {
        let homeVC = HomeVC()
        homeVC.title = L10n.titleHomePage
        homeVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(homeVC, animated: true)
    }
}
