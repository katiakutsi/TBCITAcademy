//
//  PageCell.swift
//  task 36
//
//  Created by katia kutsi on 6/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var text: UILabel!
    
    
    func bind(page: Page){
        imageView.image = page.image
        title.text = page.title
        text.text = page.text
        text.frame.size.width = contentView.frame.size.width
    }
}
