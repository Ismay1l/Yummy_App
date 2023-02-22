//
//  UIViewController+Ext.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 20.02.23.
//

import UIKit

extension UIViewController {
    
    @objc
    func viewDidLoadSwizzlingMethod() {
        self.viewDidLoadSwizzlingMethod()
        view.backgroundColor = Asset.Colors.background.color
    }
}

extension UIViewController {
    
    static func startSwizzlingViewDidLoad() {
        let defaultSelector = #selector(viewDidLoad)
        let newSelector = #selector(viewDidLoadSwizzlingMethod)
        
        let defaultInstance = class_getInstanceMethod(UIViewController.self, defaultSelector)
        let newInstance = class_getInstanceMethod(UIViewController.self, newSelector)
        
        if let instance1 = defaultInstance, let instance2 = newInstance {
            method_exchangeImplementations(instance1, instance2)
        }
    }
}

extension UIViewController {
    
    var safeLeft: NSLayoutXAxisAnchor {
        view.safeAreaLayoutGuide.leftAnchor
    }
    
    var safeRight: NSLayoutXAxisAnchor {
        view.safeAreaLayoutGuide.rightAnchor
    }
    
    var safeTop: NSLayoutYAxisAnchor {
        view.safeAreaLayoutGuide.topAnchor
    }
    
    var safeBottom: NSLayoutYAxisAnchor {
        view.safeAreaLayoutGuide.bottomAnchor
    }
    
    var safeArea: UILayoutGuide {
        view.safeAreaLayoutGuide
    }
    
    func setBackButton() {
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        item.tintColor = Asset.Colors.blackLabel.color
        navigationItem.backBarButtonItem = item
    }
    
    func hideBackButton() {
        navigationItem.hidesBackButton = true
    }
}
