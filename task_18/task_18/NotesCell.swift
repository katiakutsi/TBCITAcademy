//
//  NotesCell.swift
//  task_18
//
//  Created by katia kutsi on 5/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class NotesCell: UITableViewCell {

    
    @IBOutlet weak var shortNote: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
