//
//  SongCell.swift
//  task_24
//
//  Created by katia kutsi on 5/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var songName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
