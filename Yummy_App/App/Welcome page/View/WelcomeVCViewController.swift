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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Parent Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutViews()
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
}
