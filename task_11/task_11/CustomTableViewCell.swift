//
//  CustomTableViewCell.swift
//  task_11
//
//  Created by katia kutsi on 4/29/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell  {

    @IBOutlet weak var fnameInCell: UILabel!
    
    @IBOutlet weak var lnameInCell: UILabel!
    
    @IBOutlet weak var emailInCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
