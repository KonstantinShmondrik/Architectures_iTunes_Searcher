//
//  AppDescriptionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Шмондрик on 14.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppDescriptionViewController: UIViewController {
    
    private let app: ITunesApp
    
    private var appDescriptionView: AppDescriptionView {
        return self.view as! AppDescriptionView
    }

    // MARK: - Init
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDescriptionView(app: app)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appDescriptionView.configure(with: app)
      
    }
    
    
    

   

}
