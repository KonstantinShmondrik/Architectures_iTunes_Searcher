//
//  SongSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Шмондрик on 15.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

protocol SongSearchViewInput: AnyObject {
    
    var searchResults: [ITunesSong] { get set }
    
    func showError(error: Error)
    
    func showNoResults()
    
    func hideNoResults()
    
    func throbber(show: Bool)
    
}

protocol SongSearchViewOutput: AnyObject {
    
    func viewDidSearch(with query: String)
    
    func viewDidSelectSong(_ song: ITunesSong)
    
}

final class SongSearchPresenter {
    
    weak var viewInput: (UIViewController & SongSearchViewInput)?
    
    let interactor: SearchSongInteractorInput
    let router: SearchSongRouterInput
    
    
    init(interactor: SearchSongInteractorInput, router: SearchSongRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Private
    
    private func requestSongs(with query: String) {
        self.interactor.requestSongs(with: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue{ songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = songs
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
    
}

// MARK: - SearchViewOutput

extension SongSearchPresenter: SongSearchViewOutput {
    
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestSongs(with: query)
    }
    
    func viewDidSelectSong(_ song: ITunesSong) {
        self.router.openDetails(for: song)
    }
    
}


