//
//  UserAnimeCell.swift
//  StudioGhibli
//
//  Created by katia kutsi on 5/28/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class UserAnimeCell: UITableViewCell {
    @IBOutlet weak var animeTitle: UILabel!
    @IBOutlet weak var animeReleaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
