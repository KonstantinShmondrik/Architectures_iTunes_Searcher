//
//  SongDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Шмондрик on 16.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class SongDetailHeaderViewController: UIViewController {

    // MARK: - Properties
    
    private let song: ITunesSong
    private let imageDownloader = ImageDownloader()
    private var songDetailHeaderView: SongDetailHeaderView {
        return self.view as! SongDetailHeaderView
    }
    // MARK: - Init
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = SongDetailHeaderView(song: song)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.songDetailHeaderView.configure(with: song)
        self.fillData()
    }
    
    // MARK: - Private
    
    private func fillData() {
        self.downloadImage()
    }
    
    private func downloadImage() {
        guard let url = self.song.artwork else { return }
        self.imageDownloader.getImage(fromUrl: url) { [weak self] (image, _) in
            self?.songDetailHeaderView.albumLogoImageView.image = image
        }
    }

  

}
