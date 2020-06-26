//
//  TableViewCell.swift
//  Competition 4
//
//  Created by katia kutsi on 6/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var imv: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
