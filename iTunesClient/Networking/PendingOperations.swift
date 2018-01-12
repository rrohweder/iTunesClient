//
//  PendingOperations.swift
//  iTunesClient
//
//  Created by Roger Rohweder on 1/8/18.
//  Copyright © 2018 Roger Rohweder. All rights reserved.
//

import Foundation

class PendingOperations {
    var downloadsInProgress = [IndexPath: Operation]()
    let downloadQueue = OperationQueue()
    
}
