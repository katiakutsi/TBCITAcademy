//
//  ReviewController.swift
//  StudioGhibli
//
//  Created by katia kutsi on 5/28/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class ReviewController: UIViewController {
    @IBOutlet weak var animeTitleForReview: UILabel!
    @IBOutlet weak var reviewView: UITextView!
    @IBOutlet weak var roundedButton: UIButton!
    
    var signedUsername: String?
    var animeTitle: String?
    var reviewTextView: String?
    var isEditingReview = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animeTitleForReview.text = animeTitle
        reviewView.text = reviewTextView
        roundedButton.layer.cornerRadius = 20
        if isEditingReview == true {
            roundedButton.setTitle("Edit Review", for: .normal)
        }
    }
    
    @IBAction func addReview(_ sender: UIButton) {
        if isEditingReview == true {
            roundedButton.setTitle("Edit Review", for: .normal)
            addAnimeReview()
        }else{
            addAnimeReview()
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func addAnimeReview(){
        let context = AppDelegate.coreDataContainer.viewContext
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        var user: User?
        var anime: Anime?
        do{
            let result = try context.fetch(request)
            let users = result as [User]
            
            for u in users{
                if u.username == signedUsername{
                    user = u
                }
            }
            let animes =  (user!.animes?.allObjects as NSArray?) as! [Anime]
            
            for a in animes{
                if a.title == animeTitle{
                    anime = a
                }
            }
            
            anime?.review = reviewView.text
            
            do{
                try context.save()
            }catch{}
            
        }catch{}
    }
}
