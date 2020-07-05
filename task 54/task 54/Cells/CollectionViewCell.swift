//
//  CollectionViewCell.swift
//  task 54
//
//  Created by katia kutsi on 7/3/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import ShimmerBlocks

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imv: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var containterView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        name.text = ""
        descr.text = ""
    }
    
    private lazy var shimmerContainer = ShimmerContainer(parentView: self)
    
    private lazy var shimmerData: [ShimmerData] = {
        let titleSections = ShimmerSection.generate(minWidth: 50,
                                                    height: 21,
                                                    totalWidth: 150,
                                                    maxNumberOfSections: 3)
      
        return [ShimmerData(name, sectionSpacing: 6, sections: titleSections),
                ShimmerData(imv, matchViewDimensions: true),
                ShimmerData(descr, matchViewDimensions: true)]
    }()
    
    func isLoading(_ loading: Bool) {
        shimmerContainer.applyShimmer(enable: loading, with: shimmerData)
    }

    
    func bind(character: Character){
        
        containterView.layer.cornerRadius = 20
        
        character.image.downloadImage { (image) in
            DispatchQueue.main.async {
                self.imv.image = image
            }
        }
        name.text = character.name
        descr.text = character.species
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
      super.apply(layoutAttributes)
      
      let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
      let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
      
      let delta = ((featuredHeight - frame.height) / (featuredHeight - standardHeight))
      
      let minAlpha: CGFloat = 0.3
      let maxAlpha: CGFloat = 0.75
      
      imv.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
      
      let scale = max(delta, 0.5)
      name.transform = CGAffineTransform(scaleX: scale, y: scale)
      
      descr.alpha = 1 - delta
    }
    
}
