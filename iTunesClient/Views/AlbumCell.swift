//
//  AlbumCell.swift
//  iTunesClient
//
//  Created by Roger Rohweder on 12/29/17.
//  Copyright © 2017 Roger Rohweder. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    static let reuseIdentifier = "AlbumCell"

    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with viewModel:AlbumCellViewModel) {
        albumTitleLabel.text = viewModel.title
        genreLabel.text = viewModel.genre
        releaseDateLabel.text = viewModel.releaseDate
    }
}
