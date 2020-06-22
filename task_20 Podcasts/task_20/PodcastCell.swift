//
//  PodcastCell.swift
//  task_20
//
//  Created by katia kutsi on 5/13/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class PodcastCell: UITableViewCell {
    @IBOutlet weak var podcastTitle: UILabel!
    @IBOutlet weak var podcastShortDescription: UILabel!
    @IBOutlet weak var podcastDuration: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
