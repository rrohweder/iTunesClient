//
//  ItunesError.swift
//  iTunesClient
//
//  Created by Roger Rohweder on 1/3/18.
//  Copyright © 2018 Roger Rohweder. All rights reserved.
//

import Foundation

enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}
