//
//  AlbumListController.swift
//  iTunesClient
//
//  Created by Roger Rohweder on 12/29/17.
//  Copyright © 2017 Roger Rohweder. All rights reserved.
//

import UIKit

class AlbumListController: UITableViewController {

    private struct Constants {
        static let AlbumCellHeight: CGFloat = 80
    }
   
    var artist: Artist? {
        didSet {
            self.title = artist?.name
            dataSource.update(with: artist!.albums)
            tableView.reloadData()
        }
    }
    
    var dataSource = AlbumListDataSource(albums: [])
    let client = ItunesAPIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.AlbumCellHeight
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbum" {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                let selectedAlbum = dataSource.album(at: selectedIndexPath)
                let albumDetailController = segue.destination as! AlbumDetailController
                    client.lookupAlbum(with: selectedAlbum.id) { album, error in
                        albumDetailController.album = album
                        albumDetailController.tableView.reloadData()
                }
            }
        }
    }
    
}
