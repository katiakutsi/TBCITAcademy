//
//  CoffeeCell.swift
//  task 41
//
//  Created by katia kutsi on 6/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class CoffeeCell: UITableViewCell {
    
    @IBOutlet weak var imv: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
