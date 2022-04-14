//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        //        let rootVC = SearchViewController()
        let rootVC = SearchModuleBuilder.build()
        
        rootVC.navigationItem.title = "Search via iTunes"
        
//        let barVC = self.configuredTabBarController
//        barVC.viewControllers = [rootVC]
        
        let navVC = self.configuredNavigationController
        navVC.viewControllers = [rootVC]
        
//        let navVC = self.configuredNavigationController
//        navVC.viewControllers = [navVC]
        
        window?.rootViewController = navVC
        
//        window?.rootViewController = barVC
        
        window?.makeKeyAndVisible()
    }
    
    private lazy var configuredNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }()
    
    private lazy var configuredTabBarController: UITabBarController = {
        let barVC = UITabBarController()
        barVC.tabBar.barTintColor = UIColor.varna
        barVC.tabBar.isTranslucent = false
        return barVC
    }()
}
