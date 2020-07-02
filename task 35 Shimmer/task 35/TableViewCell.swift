//
//  TableViewCell.swift
//  task 35
//
//  Created by katia kutsi on 6/5/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var characterPic: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var origin: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        /*
        characterPic.showAnimatedGradientSkeleton()
        name.showAnimatedGradientSkeleton()
        status.showAnimatedGradientSkeleton()
        species.showAnimatedGradientSkeleton()
        gender.showAnimatedGradientSkeleton()
        origin.showAnimatedGradientSkeleton()
           */
    }
/*
    func hideAnimation() {
        characterPic.hideSkeleton()
        name.hideSkeleton()
        status.hideSkeleton()
        species.hideSkeleton()
        gender.hideSkeleton()
        origin.hideSkeleton()

    }
*/
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
