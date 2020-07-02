//
//  BandsCell.swift
//  task 43
//
//  Created by katia kutsi on 6/18/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class BandsCell: UICollectionViewCell {
    @IBOutlet weak var bandImage: UIImageView!
    @IBOutlet weak var bandName: UILabel!
    
    func bind(band: Band){
        
        bandImage.layer.cornerRadius = 20
        
        band.imgUrl.downloadImage { (image) in
            DispatchQueue.main.async {
                self.bandImage.image = image
            }
        }
        bandName.text = band.name
    }
    
}
