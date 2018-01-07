//
//  SearchResultsController.swift
//  iTunesClient
//
//  Created by Roger Rohweder on 12/28/17.
//  Copyright © 2017 Roger Rohweder. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    let dataSource = SearchResultsDataSource()
    let client = ItunesAPIClient()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchResultsController.dismissSearchResultsController))
        
        tableView.tableHeaderView = searchController.searchBar
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        tableView.dataSource = dataSource
        definesPresentationContext = true // so Search Bar is covered-up in results view
    }
    
    func dismissSearchResultsController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAlbums" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let artist = dataSource.artist(at: indexPath)
                // was: artist.albums = Stub.albums
                let albumListController = segue.destination as! AlbumListController
                client.lookupArtist(with: artist.id) { artist, error in
                    albumListController.artist = artist
                    albumListController.tableView.reloadData()
                }
                
            }
        }
    }

}

extension SearchResultsController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
/* using Stub data:
        dataSource.update(with: [Stub.artist])
        tableView.reloadData()
*/
        
        client.searchForArtists(withTerm: searchController.searchBar.text!) { [weak self]
            artists, error in
                self?.dataSource.update(with: artists)
                self?.tableView.reloadData()
            }
    }
}


