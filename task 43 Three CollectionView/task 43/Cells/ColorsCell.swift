//
//  ColorsCell.swift
//  task 43
//
//  Created by katia kutsi on 6/18/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ColorsCell: UICollectionViewCell {
    
    @IBOutlet weak var color: UIView!
    @IBOutlet weak var colorName: UILabel!
    
    func bind(color: Color){
        
        self.color.layer.cornerRadius = 20
        
        self.color.backgroundColor = UIColor(hex: color.code)
        colorName.text = color.name
    }
}
