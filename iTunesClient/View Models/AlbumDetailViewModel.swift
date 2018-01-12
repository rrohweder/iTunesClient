//
//  AlbumDetailViewModel.swift
//  iTunesClient
//
//  Created by Roger Rohweder on 12/30/17.
//  Copyright © 2017 Roger Rohweder. All rights reserved.
//

import Foundation
import UIKit

struct AlbumDetailViewModel {
    let title: String
    let genre: String
    let releaseDate: String
}

extension AlbumDetailViewModel {
    init(album: Album) {
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "MMM dd, yyyy"
        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}
