//
//  SongDetailHeaderView.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Шмондрик on 16.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class SongDetailHeaderView: UIView {
    
    public var song: ITunesSong
    
    // MARK: - Subviews
    
    private(set) lazy var albumLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private(set) lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var collectionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 0
        return label }()
    
    // MARK: - Init
    
    
    init(song: ITunesSong) {
        self.song = song
        super.init(frame: CGRect.zero)
        self.setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    private func setupLayout() {
        self.addSubview(self.albumLogoImageView)
        self.addSubview(self.trackNameLabel)
        self.addSubview(self.artistNameLabel)
        self.addSubview(self.collectionNameLabel)
        
        NSLayoutConstraint.activate([
            self.albumLogoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                                         constant: 12.0),
            self.albumLogoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.albumLogoImageView.widthAnchor.constraint(equalToConstant: 200.0),
            self.albumLogoImageView.heightAnchor.constraint(equalToConstant: 200.0),
            self.trackNameLabel.topAnchor.constraint(equalTo: self.albumLogoImageView.bottomAnchor,
                                                     constant: 12.0),
            self.trackNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                      constant: 16.0),
            self.trackNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                       constant: -16.0),
            self.artistNameLabel.topAnchor.constraint(equalTo: self.trackNameLabel.bottomAnchor,
                                                      constant: 12.0),
            self.artistNameLabel.leftAnchor.constraint(equalTo: self.trackNameLabel.leftAnchor),
            self.artistNameLabel.rightAnchor.constraint(equalTo: self.trackNameLabel.rightAnchor),
            self.collectionNameLabel.topAnchor.constraint(equalTo: self.artistNameLabel.bottomAnchor,
                                                          constant: 12.0),
            self.collectionNameLabel.leftAnchor.constraint(equalTo: self.artistNameLabel.leftAnchor),
            self.collectionNameLabel.rightAnchor.constraint(equalTo: self.artistNameLabel.rightAnchor),
            self.collectionNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
    
    func configure(with song: ITunesSong) {
        self.trackNameLabel.text = song.trackName
        self.artistNameLabel.text = song.artistName
        self.collectionNameLabel.text = song.collectionName
    }
    
}
