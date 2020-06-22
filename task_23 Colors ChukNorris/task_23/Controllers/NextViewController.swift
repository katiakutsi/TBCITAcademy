//
//  NextViewController.swift
//  task_23
//
//  Created by katia kutsi on 5/18/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

struct Joke : Codable {
    var iconUrl : String
    var value : String
}

class NextViewController: UIViewController {
    
    @IBOutlet weak var jackIcon: UIImageView!
    @IBOutlet weak var jackJoke: UILabel!
    
    var joke: Joke?
    
    var newJoke: String?
    var icon: UIImage?
        
    var storyboardColor = UIColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        get(){
            self.jackIcon.image = self.icon
            self.jackJoke.text = self.newJoke
        }
        
        view.backgroundColor = storyboardColor
        
    }
    
    func get(completion: @escaping ()->()) {
        let url = URL(string: "https://api.chucknorris.io/jokes/random?category=dev")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
        
            guard let jokeData = data else {return}
            let json = try? JSONSerialization.jsonObject(with: jokeData, options: [])
            guard let jsonDict = json as? [String:Any] else {return}
            self.joke = Joke(iconUrl: jsonDict["icon_url"] as! String, value: jsonDict["value"] as! String)
            self.joke!.iconUrl.downloadImage { (image) in
                DispatchQueue.main.async {
                    self.newJoke = self.joke!.value
                    self.icon = image
                    completion()
                }
            }
        }.resume()
    }
}

extension String {
    
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: self) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
        }.resume()
    }
    
}
