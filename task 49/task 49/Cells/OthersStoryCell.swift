//
//  OthersStoryCell.swift
//  task 49
//
//  Created by katia kutsi on 6/30/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class OthersStoryCell: UICollectionViewCell {
    
    @IBOutlet weak var imv: UIImageView!
    
    public static let identifier = "others_story_cell"
    
    func makeStory() {
        imv.layer.cornerRadius = imv.frame.width/2
        imv.layer.borderWidth = 4
        imv.layer.borderColor = Colors.MossGreen?.cgColor
    }
}
