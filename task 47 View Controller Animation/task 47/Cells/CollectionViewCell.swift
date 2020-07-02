//
//  CollectionViewCell.swift
//  task 47
//
//  Created by katia kutsi on 6/24/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imv: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imv.layer.cornerRadius = 16
        
    }
    
}
