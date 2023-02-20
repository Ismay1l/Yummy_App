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
