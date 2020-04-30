//
//  NewsTableViewCell.swift
//  task_12
//
//  Created by katia kutsi on 4/30/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var desctiptionLabel: UILabel!
    
    @IBOutlet weak var imageViewOnCell: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
