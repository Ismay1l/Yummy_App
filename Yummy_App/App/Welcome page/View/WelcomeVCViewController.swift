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
        setUpBackBarButton()
        addNotificationObserver()
    }
    
    //MARK: - Functions
    private func layoutViews() {
        view.addSubview(onboardingView)
        
        NSLayoutConstraint.activate([
            onboardingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            onboardingView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            onboardingView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            onboardingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setUpBackBarButton() {
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        item.tintColor = Asset.Colors.blackLabel.color
        self.navigationItem.backBarButtonItem = item
    }
    
    private func addNotificationObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(receiveNotification), name: NSNotification.Name(NotificationName.backToWelcomeVC.message), object: nil)
    }
    
    @objc
    private func receiveNotification() {
        onboardingView.currentPage = 0
        let index = IndexPath(item: onboardingView.currentPage, section: 0)
        onboardingView.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
}

extension WelcomeVC: OnboardingViewDelegate {
    
    func didTapGetStarted() {
        let homeVC = HomeVC()
        homeVC.title = "Home"
        homeVC.navigationItem.largeTitleDisplayMode = .never
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        homeVC.navigationItem.backBarButtonItem = item
        navigationController?.pushViewController(homeVC, animated: true)
    }
}
