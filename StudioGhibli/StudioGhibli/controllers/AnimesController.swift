//
//  AnimesController.swift
//  StudioGhibli
//
//  Created by katia kutsi on 5/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

struct AnimeStruct {
    var title : String
    var description : String
    var director : String
    var producer : String
    var releaseDate : String
}

class AnimesController: UIViewController {

    @IBOutlet weak var animesTable: UITableView!
    
    var animes = [AnimeStruct]()
    var currentAnime : AnimeStruct?
    var signedUsername: String?
    var delayCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animesTable.delegate = self
        animesTable.dataSource = self
        
        get(){}
        
        animesTable.rowHeight = 85
    }
    
    
    func get(completion: @escaping ()->()){
        
        let url = URL(string: "https://ghibliapi.herokuapp.com/films")!
        URLSession.shared.dataTask(with: url){ (data, res, err) in
            
            do {
                guard let data = data else {return}
                let animesArray = try JSONSerialization.jsonObject(with: data) as! Array<Dictionary<String,Any>>
                for anime in animesArray {
                    let title = anime["title"] ?? ""
                    let description = anime["description"] ?? ""
                    let director = anime["director"] ?? ""
                    let producer = anime["producer"] ?? ""
                    let releaseDate = anime["release_date"] ?? ""
                    self.animes.append(AnimeStruct(title: title as! String, description: description as! String, director: director as! String, producer: producer as! String, releaseDate: releaseDate as! String))
                    DispatchQueue.main.async {
                        completion()
                        self.animesTable.reloadData()
                    }
                }
            } catch { }
        }.resume()
 
    }
  
}
extension AnimesController : UITableViewDelegate{}
extension AnimesController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = animesTable.dequeueReusableCell(withIdentifier: "anime_cell", for: indexPath) as! AnimeCell
        let anime = animes[indexPath.row]
        cell.title.text = anime.title
        cell.releaseDate.text = anime.releaseDate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let FullInfoVC = storyboard.instantiateViewController(withIdentifier: "full_info_page")
        if let unwrappedVC = FullInfoVC as? FullInfoController{
            unwrappedVC.currentAnime = animes[indexPath.row]
            unwrappedVC.signedUsername = signedUsername
        }
        self.navigationController?.pushViewController(FullInfoVC, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.alpha = 0
        UIView.animate(withDuration: 1.5) {
            cell.alpha = 1
        }
    }
 
}
