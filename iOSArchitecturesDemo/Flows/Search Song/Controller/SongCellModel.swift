//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Константин Шмондрик on 15.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

struct SongCellModel {
    let trackName: String
    let artistName: String?
    let collectionName: String?
    let artwork: String?
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
    
    
        
        return SongCellModel(trackName: model.trackName,
                             artistName: model.artistName,
                             collectionName: model.collectionName,
                             artwork: model.artwork)
        
        
    }
    
   
    
    
}
