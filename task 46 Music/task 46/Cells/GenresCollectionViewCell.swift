//
//  GenresCollectionViewCell.swift
//  task 46
//
//  Created by katia kutsi on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class GenresCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var genre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        uiView.layer.cornerRadius = 16
    }

}
