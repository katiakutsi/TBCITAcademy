//
//  AnimeCell.swift
//  StudioGhibli
//
//  Created by katia kutsi on 5/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class AnimeCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
