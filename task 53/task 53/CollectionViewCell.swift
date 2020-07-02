//
//  CollectionViewCell.swift
//  task 53
//
//  Created by katia kutsi on 7/2/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imv: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descr: UILabel!
    
    override func awakeFromNib() {
      super.awakeFromNib()
      containerView.layer.cornerRadius = 10
      containerView.layer.masksToBounds = true
    }
    
    func bind(gecko: Gecko){
        
        name.text = gecko.name
        descr.text = gecko.descr
        if let imageData = gecko.photo {
            imv.image = UIImage(data: imageData)
        }
        
    }
}
