//
//  SongSearchModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Шмондрик on 15.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class SongSearchModuleBuilder {
    
    static func build() -> (UIViewController & SongSearchViewInput) {
        let presenter = SongSearchPresenter()
        let viewController = SongSearchViewController(presenter: presenter)
        presenter.viewInput = viewController

        return viewController
    }
}
