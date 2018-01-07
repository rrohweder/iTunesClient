//
//  QueryItemProvider.swift
//  iTunesClient
//
//  Created by Roger Rohweder on 1/2/18.
//  Copyright © 2018 Roger Rohweder. All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
