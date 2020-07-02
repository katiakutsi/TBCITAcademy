//
//  SongsCollectionViewCell.swift
//  task 46
//
//  Created by katia kutsi on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SongsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imv: UIImageView!
    @IBOutlet weak var num: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var artist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imv.layer.cornerRadius = 16
        num.layer.cornerRadius = 10
        num.layer.masksToBounds = true

    }

}
