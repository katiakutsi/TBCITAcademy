//
//  HeaderCell.swift
//  task 49
//
//  Created by katia kutsi on 6/30/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

protocol MyCustomCellDelegator {
    func callSegueFromCell(cell: OthersStoryCell)
}

class HeaderCell: UITableViewCell {

    var delegate : MyCustomCellDelegator!
    
    public static let identifier = "header_cell"

    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    var didSelectItemAction: ((IndexPath, OthersStoryCell) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

extension HeaderCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexPath) as! StoryCell
            return cell
        }
        
        let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: OthersStoryCell.identifier, for: indexPath) as! OthersStoryCell

        cell.makeStory()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            
            let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: OthersStoryCell.identifier, for: indexPath) as! OthersStoryCell
            
            self.delegate.callSegueFromCell(cell: collectionView.cellForItem(at: indexPath) as! OthersStoryCell)
            didSelectItemAction?(indexPath, collectionView.cellForItem(at: indexPath) as! OthersStoryCell)
        }
    }
    
    
}

extension HeaderCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: storyCollectionView.frame.width/4, height: storyCollectionView.frame.height)
    }
}

