//
//  SearchModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Шмондрик on 13.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class SearchModuleBuilder {
    
    static func build() -> (UIViewController & SearchViewInput) {
        let presenter = SearchPresenter()
        let viewController = SearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        
        return viewController
    }
}
