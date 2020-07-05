//
//  ViewController.swift
//  task 54
//
//  Created by katia kutsi on 7/3/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var characters = [Character]()
    let apiService = APIService()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        apiService.getCharacters { (charactersResponse) in
            self.characters.append(contentsOf: charactersResponse.characters)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }


}

extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) - 150
        return CGSize(width: itemSize, height: 300)
    }
}
extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        UIView.animate(withDuration: 2, delay: 0, options: [], animations: {
            cell.isLoading(true)

            
        }) { (f) in
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                
                cell.isLoading(false)
                cell.bind(character: self.characters[indexPath.row])

            }) { (f) in
                
            }
        }
        return cell
    }
    
    
}

