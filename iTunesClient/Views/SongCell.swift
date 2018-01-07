//
//  SongCell.swift
//  iTunesClient
//
//  Created by Roger Rohweder on 12/30/17.
//  Copyright © 2017 Roger Rohweder. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    static let reuseIdentifier = "SongCell"
    
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var songRuntimeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    // Configure the view for the selected state
    func configure(with viewModel:SongViewModel) {
        songTitleLabel.text = viewModel.title
        songRuntimeLabel.text = viewModel.runtime
    }

}
