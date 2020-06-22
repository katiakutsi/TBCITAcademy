//
//  BandViewController.swift
//  task_24
//
//  Created by katia kutsi on 5/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

struct BandSong {
    var band: String
    var songs: [String:String]
}

class BandViewController: UIViewController {
    @IBOutlet weak var bandName: UILabel!
    @IBOutlet weak var bandBio: UITextView!
    @IBOutlet weak var songsTable: UITableView!
    
    var bandNameForSegue: String?
    var bandBioForSegue: String?
        
    var songs = [String]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        bandName.text = bandNameForSegue
        bandBio.text = bandBioForSegue
        songsTable.delegate = self
        songsTable.dataSource = self
        
        get()
    }
    
    func get() {
        let url = URL(string: "http://www.mocky.io/v2/5ec3ca1c300000e5b039c407")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                guard let jsonDict = json as? [String:Any] else {return}
                guard let songsData = jsonDict["data"] as? Array<Dictionary<String, Any>> else {return}
                
                for obj in songsData {
                    if obj["band"] as? String == self.bandNameForSegue {
                        if let songs = obj["songs"] as? [Dictionary<String, String>] {
                            for song in songs {
                                self.songs.append(song["title"]!)
                            }
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    self.songsTable.reloadData()
                }
            } catch {print(error)}
        }.resume()
    }
    
}
extension BandViewController : UITableViewDelegate{}
extension BandViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = songsTable.dequeueReusableCell(withIdentifier: "song_cell", for: indexPath) as! SongCell
        cell.songName.text = songs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let LyricsVC = storyboard.instantiateViewController(withIdentifier: "lyrics_page")
        if let unwrappedVC = LyricsVC as? LyricsViewController{
            unwrappedVC.songTitle = songs[indexPath.row]
            unwrappedVC.artist = bandNameForSegue
        }
        self.navigationController?.pushViewController(LyricsVC, animated: true)
    }
    
}
