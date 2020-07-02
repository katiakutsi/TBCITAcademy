//
//  ViewController.swift
//  task 46
//
//  Created by katia kutsi on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ExploreController: UIViewController {
    
    @IBOutlet weak var recentlyPlayedCollectionView: UICollectionView!
    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    @IBOutlet weak var podcastsCollectionView: UICollectionView!
    @IBOutlet weak var artistsCollectionView: UICollectionView!
    @IBOutlet weak var genresCollectionView: UICollectionView!
    
    let recentlyPlayed = [
        Music(image: UIImage(named: "im-cover1")!, title: "061 Marketing..."),
        Music(image: UIImage(named: "im-cover2")!, title: "Lights"),
        Music(image: UIImage(named: "im-cover3")!, title: "Sounds Like G..."),
        Music(image: UIImage(named: "im-cover4")!, title: "Havana")
    ]
    
    let recommended = [
        Music(image: UIImage(named: "im-cover5")!, title: "Bass Rani", artist: "Nucleya"),
        Music(image: UIImage(named: "im-cover6")!, title: "Gully Boy", artist: "Various Artists"),
        Music(image: UIImage(named: "im-cover7")!, title: "X", artist: "Ed Sheeran"),
        Music(image: UIImage(named: "im-cover8")!, title: "Kohinoor", artist: "DIVINE")
    ]
    
    let podcasts = [
        Music(image: UIImage(named: "im-cover9")!, title: "The GaryVee Audio Experience"),
        Music(image: UIImage(named: "im-cover3")!, title: "Wireframe"),
        Music(image: UIImage(named: "im-cover11")!, title: "Design Better Podcast"),
        Music(image: UIImage(named: "im-cover1")!, title: "The Futur Podcast"),
    ]
    
    let artists = [
        Music(image: UIImage(named: "im-cover13")!, artist: "DIVINE"),
        Music(image: UIImage(named: "im-cover14")!, artist: "DJ Snake"),
        Music(image: UIImage(named: "im-cover15")!, artist: "RITVIZ"),
        Music(image: UIImage(named: "im-cover16")!, artist: "Nucleya"),
        Music(image: UIImage(named: "im-cover17")!, artist: "David Guetta")
    ]
    
    let genres = ["Pop", "Hip-hop", "Jazz", "Electronic", "Folk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recentlyPlayedCollectionView.delegate = self
        recentlyPlayedCollectionView.dataSource = self
        recentlyPlayedCollectionView.register(UINib(nibName: "RecentlyPlayedCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "recently_played_cell")
        
        recommendedCollectionView.delegate = self
        recommendedCollectionView.dataSource = self
        recommendedCollectionView.register(UINib(nibName: "RecommendedCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "RecommendedCollectionViewCell")
        
        podcastsCollectionView.delegate = self
        podcastsCollectionView.dataSource = self
        podcastsCollectionView.register(UINib(nibName: "PodcastsCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "PodcastsCollectionViewCell")
        
        artistsCollectionView.delegate = self
        artistsCollectionView.dataSource = self
        artistsCollectionView.register(UINib(nibName: "ArtistsCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "ArtistsCollectionViewCell")
        
        genresCollectionView.delegate = self
        genresCollectionView.dataSource = self
        genresCollectionView.register(UINib(nibName: "GenresCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "GenresCollectionViewCell")
        
    }

}

extension ExploreController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView.tag {
        case 0:
            return CGSize(width: recentlyPlayedCollectionView.frame.size.width/3 + 20, height: recentlyPlayedCollectionView.frame.size.height)
        case 1:
            return CGSize(width: recommendedCollectionView.frame.size.width/2 + 20, height: recommendedCollectionView.frame.size.height)
        case 2:
            return CGSize(width: podcastsCollectionView.frame.size.width/2 + 20, height: podcastsCollectionView.frame.size.height)
        case 3:
            return CGSize(width: artistsCollectionView.frame.size.width/3 + 20, height: artistsCollectionView.frame.size.height)
        case 4:
            return CGSize(width: genresCollectionView.frame.size.width/2 - 20, height: genresCollectionView.frame.size.height)
        default:
            return CGSize(width: 0, height: 0)
        }
        
    }
}
extension ExploreController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
        case 0:
            return recentlyPlayed.count
        case 1:
            return recommended.count
        case 2:
            return podcasts.count
        case 3:
            return artists.count
        case 4:
            return genres.count
        default:
            return 0
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 0:
            let cell = recentlyPlayedCollectionView.dequeueReusableCell(withReuseIdentifier: "recently_played_cell", for: indexPath) as! RecentlyPlayedCollectionViewCell
            let music = recentlyPlayed[indexPath.row]
            cell.imv.image = music.image
            cell.title.text = music.title
            return cell
        case 1:
            let cell = recommendedCollectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCollectionViewCell", for: indexPath) as! RecommendedCollectionViewCell
            let music = recommended[indexPath.row]
            cell.imv.image = music.image
            cell.title.text = music.title
            cell.artist.text = music.artist
            return cell
        case 2:
            let cell = podcastsCollectionView.dequeueReusableCell(withReuseIdentifier: "PodcastsCollectionViewCell", for: indexPath) as! PodcastsCollectionViewCell
            let music = podcasts[indexPath.row]
            cell.imv.image = music.image
            cell.title.text = music.title
            return cell
        case 3:
            let cell = artistsCollectionView.dequeueReusableCell(withReuseIdentifier: "ArtistsCollectionViewCell", for: indexPath) as! ArtistsCollectionViewCell
            let artist = artists[indexPath.row]
            cell.imv.image = artist.image
            cell.artist.text = artist.artist
            return cell
        case 4:
            let cell = genresCollectionView.dequeueReusableCell(withReuseIdentifier: "GenresCollectionViewCell", for: indexPath) as! GenresCollectionViewCell
            cell.genre.text = genres[indexPath.row]
            return cell
        default:
           return UICollectionViewCell()
        }
    }
}
