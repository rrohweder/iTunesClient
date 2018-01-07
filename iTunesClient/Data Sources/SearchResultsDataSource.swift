//
//  SearchResultsDataSource.swift
//  iTunesClient
//
//  Created by Roger Rohweder on 12/28/17.
//  Copyright © 2017 Roger Rohweder. All rights reserved.
//

import UIKit

class SearchResultsDataSource: NSObject, UITableViewDataSource {
    private var data = [Artist]()
    
    override init() {
        super.init()
    }
    
    func update(with artists: [Artist]) {
        data = artists
    }
    
    // MARK: - Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        let artist = data[indexPath.row]
        cell.textLabel?.text = artist.name
        return cell
    }
    
    // MARK: - Helper Methods
    func artist(at indexPath: IndexPath) -> Artist {
        return data[indexPath.row]
    }
}
