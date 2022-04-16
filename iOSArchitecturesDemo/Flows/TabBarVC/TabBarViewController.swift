//
//  TabBarViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Шмондрик on 14.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit


final class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        let tabApp = SearchModuleBuilder.build()
        
        let tabBarItemApp = UITabBarItem(title: "Apps",
                                         image: UIImage(systemName: "app"),
                                         selectedImage: UIImage(systemName: "app.fill"))
        
        tabApp.tabBarItem = tabBarItemApp
        
        
        let tabSong = SongSearchModuleBuilder.build()
        
        let tabBarItemSong = UITabBarItem(title: "Songs",
                                          image: UIImage(systemName: "music.mic.circle"),
                                          selectedImage: UIImage(systemName: "music.mic.circle.fill"))
        
        tabSong.tabBarItem = tabBarItemSong
        
        
        self.viewControllers = [tabApp, tabSong]
    }
}
