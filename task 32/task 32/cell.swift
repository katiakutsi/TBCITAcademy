//
//  cell.swift
//  task 32
//
//  Created by katia kutsi on 6/2/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class cell: UITableViewCell {
    @IBOutlet weak var circle: UIImageView!
    @IBOutlet weak var activity: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
