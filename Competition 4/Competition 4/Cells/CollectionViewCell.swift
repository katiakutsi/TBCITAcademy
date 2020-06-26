//
//  CollectionViewCell.swift
//  Competition 4
//
//  Created by katia kutsi on 6/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imv: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imv.layer.cornerRadius = 16
    }

}
