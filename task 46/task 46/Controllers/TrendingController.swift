//
//  TrendingController.swift
//  task 46
//
//  Created by katia kutsi on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class TrendingController: UIViewController {
    @IBOutlet weak var genresCollectionView: UICollectionView!
    @IBOutlet weak var trendingCollectionView: UICollectionView!
    
    let viewModel = ViewModel()
    var songs = [Song]()
    
    let genres = ["All", "Hip-hop", "Podcasts", "Bollywood", "R&B", "Jazz"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        genresCollectionView.delegate = self
        genresCollectionView.dataSource = self
        genresCollectionView.register(UINib(nibName: "GenresCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "GenresCollectionViewCell")
        
        viewModel.getObjects { (objects) in
            self.songs.append(contentsOf: objects)
            print(self.songs)
            DispatchQueue.main.async {
                self.trendingCollectionView.reloadData()
            }
        }
    }

}

extension TrendingController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            return CGSize(width: genresCollectionView.frame.size.width/2 - 20, height: genresCollectionView.frame.size.height)
        case 1:
            return CGSize(width: trendingCollectionView.frame.size.width, height: 115)
        default:
            return CGSize(width: 0, height: 0)
        }
        
    }
}
extension TrendingController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return genres.count
        case 1:
            return songs.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = genresCollectionView.dequeueReusableCell(withReuseIdentifier: "GenresCollectionViewCell", for: indexPath) as! GenresCollectionViewCell
        cell.genre.text = genres[indexPath.row]
        return cell
    }
    
    
}
