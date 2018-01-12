//
//  ArtworkDownloader.swift
//  iTunesClient
//
//  Created by Roger Rohweder on 1/8/18.
//  Copyright © 2018 Roger Rohweder. All rights reserved.
//

import Foundation
import UIKit

class ArtworkDownloader: Operation {
    let album: Album
    
    init(album: Album) {
        self.album = album
        super.init()
    }
    override func main() {
        if self.isCancelled {
            return
        }
        guard let url = URL(string:album.artworkUrl) else {
            return
        }
        let imageData = try! Data(contentsOf: url)
        // OK to do it this^ way, because we are going to launch these in their
        // own threads, off of the main thread. The wait for one won't hang-up the rest.
        // SHOULD hand an error with catch, instead of "try!"
        if self.isCancelled {
            return
        }
        // check to see if data is valid
        if imageData.count > 0 {
            album.artwork = UIImage(data: imageData)
            album.artworkState = .downloaded
        } else {
            album.artworkState = .failed
        }
        
    }
}
