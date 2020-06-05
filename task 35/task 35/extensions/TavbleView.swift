//
//  TavbleView.swift
//  task 35
//
//  Created by katia kutsi on 6/6/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation
import UIKit
import SkeletonView

extension ViewController : UITableViewDelegate { }
extension ViewController : SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "table_cell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table_cell", for: indexPath) as! TableViewCell
        
        UIView.animate(withDuration: 5, delay: 0, options: [], animations: {
            
            cell.showAnimatedGradientSkeleton()
            
        }) { (f) in
            UIView.animate(withDuration: 1, delay: 3, options: [], animations: {
                
                cell.hideSkeleton()
                let character = self.characters[indexPath.row]
        
                cell.name.text = character.name
                cell.status.text = character.status
                cell.species.text = character.species
                cell.gender.text = character.gender
                cell.origin.text = character.origin.name
                character.image.downloadImage{ (image) in
                    DispatchQueue.main.async {
                        cell.characterPic.image = image
                    }
                }
            }) { (f) in
                
            }
        }
        
        
        
        return cell
    }
    
}


