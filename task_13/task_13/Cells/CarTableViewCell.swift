//
//  CarTableViewCell.swift
//  task_13
//
//  Created by katia kutsi on 5/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
