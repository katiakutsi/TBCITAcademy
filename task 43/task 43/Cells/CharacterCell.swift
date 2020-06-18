//
//  CharacterCell.swift
//  task 43
//
//  Created by katia kutsi on 6/18/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImv: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    func bind(character: Character){
        
        characterImv.layer.cornerRadius = 20
        
        character.image.downloadImage { (image) in
            DispatchQueue.main.async {
                self.characterImv.image = image
            }
        }
        characterName.text = character.name
    }
}
