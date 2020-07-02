//
//  SearchController.swift
//  task 46
//
//  Created by katia kutsi on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var songsCollectionView: UICollectionView!
    
    let viewModel = SongsViewModel()
    var songs = [Song]()
    var filteredSongs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        songsCollectionView.delegate = self
        songsCollectionView.dataSource = self
        songsCollectionView.register(UINib(nibName: "SearchedSongCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "SearchedSongCollectionViewCell")
        
        viewModel.getObjects { (objects) in
            self.songs.append(contentsOf: objects)
            DispatchQueue.main.async {
                self.songsCollectionView.reloadData()
            }
        }
    }
    

}
extension SearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: songsCollectionView.frame.size.width, height: 71)
    }
}
extension SearchController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredSongs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = songsCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchedSongCollectionViewCell", for: indexPath) as! SearchedSongCollectionViewCell
        let song = filteredSongs[indexPath.row]
        song.album.coverBig.downloadImage { (image) in
            DispatchQueue.main.async {
                cell.imv.image = image
            }
        }
        cell.title.text = song.album.title
        cell.artist.text = song.artist.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}

extension SearchController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty == false {
            filteredSongs = songs.filter({ $0.artist.name.contains(searchText) || $0.album.title.contains(searchText) })
            songsCollectionView.reloadData()
        } else {
            filteredSongs.removeAll()
            songsCollectionView.reloadData()
        }
    }
}
