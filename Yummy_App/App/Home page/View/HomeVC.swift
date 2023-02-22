//
//  ViewController.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 19.02.23.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: - UI Elements
    private lazy var foodCollectionView: FoodCollectionView = {
        let view = FoodCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Parent Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        hideBackButton()
        setBarButton()
        layoutViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.post(name: NSNotification.Name(NotificationName.backToWelcomeVC.message),
                                        object: nil)
    }
    
    //MARK: - Functions
    private func setBarButton() {
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart.circle.fill"),
                                         style: .plain,
                                         target: nil,
                                         action: nil)
        cartButton.tintColor = Asset.Colors.red.color
        navigationItem.rightBarButtonItem = cartButton
    }
    
    private func layoutViews() {
        view.addSubview(foodCollectionView)
        
        NSLayoutConstraint.activate([
            foodCollectionView.topAnchor.constraint(equalTo: safeTop),
            foodCollectionView.leftAnchor.constraint(equalTo: safeLeft, constant: 10),
            foodCollectionView.rightAnchor.constraint(equalTo: safeRight, constant: -10),
            foodCollectionView.bottomAnchor.constraint(equalTo: safeBottom, constant: -10)
        ])
    }
}

