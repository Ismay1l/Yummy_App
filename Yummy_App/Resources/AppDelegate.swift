//
//  AppDelegate.swift
//  Yummy_App
//
//  Created by Ismayil Ismayilov on 19.02.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        let viewController = UINavigationController(rootViewController: WelcomeVC())
//        window?.rootViewController = viewController
//        window?.makeKeyAndVisible()
        
        UIViewController.startSwizzlingViewDidLoad()
        return true
    }
}

