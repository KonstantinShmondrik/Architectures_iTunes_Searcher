//
//  DescriptionView.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Шмондрик on 14.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppDescriptionView: UIView {
    
    public var app: ITunesApp
    
    // MARK: - Subviews
    
    // заголовок "Что нового"
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 1
        return label
    }()
    
    // номер версии
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    // дата версии
    private(set) lazy var versionDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    // описание изменения
    private(set) lazy var releaseNotesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        return label
    }()
    
    // история изменений (кнопка)
    private(set) lazy var versionHistoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("История версий", for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 16.0
        button.addTarget(self, action: #selector(versionHistoryButtonPressed), for: .touchUpInside)
        return button }()
    
    
    
    // MARK: - Init
    
    
    init(app: ITunesApp) {
        self.app = app
        super.init(frame: CGRect.zero)
        self.setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    private func setupLayout() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.versionLabel)
        self.addSubview(self.versionDateLabel)
        self.addSubview(self.releaseNotesLabel)
        self.addSubview(self.versionHistoryButton)
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                                 constant: 12.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                  constant: 16.0),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 30),
            self.titleLabel.widthAnchor.constraint(equalToConstant: 120),
            
            self.versionHistoryButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                                           constant: 12.0),
            self.versionHistoryButton.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                             constant: -16.0),
            self.versionHistoryButton.heightAnchor.constraint(equalToConstant: 30),
            self.versionHistoryButton.widthAnchor.constraint(equalToConstant: 120),
            
            self.versionLabel.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                    constant: 16.0),
            self.versionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12),
            self.versionLabel.widthAnchor.constraint(equalToConstant: 120.0),
            self.versionLabel.heightAnchor.constraint(equalToConstant: 30),
            
            self.versionDateLabel.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                         constant: -16.0),
            self.versionDateLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12),
            self.versionDateLabel.widthAnchor.constraint(equalToConstant: 120.0),
            
            self.releaseNotesLabel.topAnchor.constraint(equalTo: self.versionLabel.bottomAnchor, constant: 12),
            self.releaseNotesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            self.releaseNotesLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            self.releaseNotesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func configure(with app: ITunesApp) {
        self.titleLabel.text = "Что нового"
        self.versionLabel.text = "Версия \(app.version ?? "0.0.0")"
        self.versionDateLabel.text = app.currentVersionReleaseDate
        self.releaseNotesLabel.text = app.releaseNotes
    }
    
    // MARK: - Actions
    
    @objc private func versionHistoryButtonPressed() {
        // переход на список историй версий
    }
    
    
}
