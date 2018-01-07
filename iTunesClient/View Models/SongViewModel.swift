//
//  SongViewModel.swift
//  iTunesClient
//
//  Created by Roger Rohweder on 12/30/17.
//  Copyright © 2017 Roger Rohweder. All rights reserved.
//

import Foundation

struct SongViewModel {
    let title: String
    let runtime: String
}

extension SongViewModel {
    init(song: Song) {
        title = song.censoredName
        
        // runtime is in milliseconds
        let timeInSeconds = song.trackTime / 1000
        let minutes = timeInSeconds/60 % 60
        let seconds = timeInSeconds % 60
        self.runtime = "\(minutes):\(seconds)"
    
    }
}
