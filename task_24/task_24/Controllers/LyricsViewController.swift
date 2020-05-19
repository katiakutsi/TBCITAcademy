//
//  LyricsViewController.swift
//  task_24
//
//  Created by katia kutsi on 5/20/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class LyricsViewController: UIViewController {
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var lyricsTextView: UITextView!
    
    var songTitle: String?
    var artist: String?
    var lyrics: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songName.text = songTitle
        get(){
            self.lyricsTextView.text = self.lyrics
        }
    }
    
    func get(completion: @escaping ()->()){
        let modifiedArtist = self.artist!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!.replacingOccurrences(of: "/", with: "", options: .literal, range: nil)
        let modifiedTitle = self.songTitle!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!.replacingOccurrences(of: "/", with: "", options: .literal, range: nil)

        let url = URL(string: "https://api.lyrics.ovh/v1/\(modifiedArtist)/\(modifiedTitle)")!
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else{return}
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            guard let jsonDict = json as? [String:String] else{return}
            self.lyrics = (jsonDict["lyrics"])
            DispatchQueue.main.async {
                completion()
            }
        }.resume()
        
    }
    
    
}
