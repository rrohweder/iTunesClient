//
//  AlbumCellViewModel.swift
//  iTunesClient
//
//  Created by Roger Rohweder on 12/29/17.
//  Copyright © 2017 Roger Rohweder. All rights reserved.
//

import Foundation

struct AlbumCellViewModel {
    let title: String
    let genre: String
    let releaseDate: String
}

extension AlbumCellViewModel {
    init(album: Album) {
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "MMM dd, yyyy"
        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}
