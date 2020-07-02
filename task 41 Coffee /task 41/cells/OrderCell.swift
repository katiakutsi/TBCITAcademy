//
//  OrderCell.swift
//  task 41
//
//  Created by katia kutsi on 6/16/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {
    @IBOutlet weak var coffeeImv: UIImageView!
    @IBOutlet weak var coffeeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
