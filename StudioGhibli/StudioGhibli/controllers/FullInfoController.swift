//
//  FullInfoController.swift
//  StudioGhibli
//
//  Created by katia kutsi on 5/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class FullInfoController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var releaseTimeLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var outletButton: UIButton!
    
    var currentAnime: AnimeStruct?
    var signedUsername: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = currentAnime?.title
        directorLabel.text = "Director : \(currentAnime?.director ?? "")"
        producerLabel.text = "Producer : \(currentAnime?.producer ?? "")"
        releaseTimeLabel.text = currentAnime?.releaseDate
        descriptionTextView.text = currentAnime?.description
        
        outletButton.layer.cornerRadius = 20
    }

    @IBAction func addToWatchList(_ sender: UIButton) {
        save()
        self.navigationController?.popViewController(animated: true)
    }
    
    func fetchUsers() -> [User]{
        let context = AppDelegate.coreDataContainer.viewContext
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        do{
            let result = try context.fetch(request)
            let users = result as [User]
            return users
        }catch{}
        return []
    }
    
    func save(){
        let context = AppDelegate.coreDataContainer.viewContext
        let anime = Anime(context: context)
        
        var user: User?
        
        
        for u in fetchUsers(){
            if u.username == signedUsername{
                user = u
            }
        }
        
        anime.title = titleLabel.text
        anime.director = directorLabel.text
        anime.producer = producerLabel.text
        anime.releaseDate = releaseTimeLabel.text
        anime.fullDescription = descriptionTextView.text
        anime.watcher = user
        
        do{
            try context.save()
        }catch {}
    }
}
