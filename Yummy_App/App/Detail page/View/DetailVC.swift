//
//  DetailVC.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 07.03.23.
//

import UIKit

class DetailVC: UIViewController {
    
    //MARK: - UI Elements
    private lazy var foodImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
//        view.layer.cornerRadius = 10
//        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: - Parent Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
