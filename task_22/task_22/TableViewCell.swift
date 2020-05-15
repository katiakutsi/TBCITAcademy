//
//  TableViewCell.swift
//  task_22
//
//  Created by katia kutsi on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var profPictureOnCell: UIImageView!
    @IBOutlet weak var firstNameOnCell: UILabel!
    @IBOutlet weak var lastNameOnCell: UILabel!
    @IBOutlet weak var contentOnCell: UILabel!
    @IBOutlet weak var dateOnCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
