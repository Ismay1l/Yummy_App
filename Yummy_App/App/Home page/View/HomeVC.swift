//
//  ViewController.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 19.02.23.
//

import UIKit

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.post(name: NSNotification.Name(NotificationName.backToWelcomeVC.message), object: nil)
    }
}

