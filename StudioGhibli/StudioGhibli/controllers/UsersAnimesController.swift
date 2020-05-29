//
//  UsersAnimesController.swift
//  StudioGhibli
//
//  Created by katia kutsi on 5/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class UsersAnimesController: UIViewController {
    @IBOutlet weak var userAnimeTable: UITableView!
    
    var signedUsername: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userAnimeTable.delegate = self
        userAnimeTable.dataSource = self
        userAnimeTable.rowHeight = 85
        self.navigationItem.title = "My Watch List"
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userAnimeTable.reloadData()
    }
    
    @IBAction func addBarButton(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let AnimesVC = storyboard.instantiateViewController(withIdentifier: "animes_page")
        if let unwrappedVC = AnimesVC as? AnimesController{
            unwrappedVC.signedUsername = signedUsername
        }
        self.navigationController?.pushViewController(AnimesVC, animated: true)
    }
    
    func fetchAnimes() -> [Anime]{
        let context = AppDelegate.coreDataContainer.viewContext
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        var user: User?
        
        do{
            let result = try context.fetch(request)
            let users = result as [User]
            
            for u in users{
                if u.username == signedUsername{
                    user = u
                }
            }
            return ((user!.animes?.allObjects as NSArray?) as! [Anime]).sorted(by: { ($0.title)!.compare(($1.title)!) == .orderedAscending })
        }catch{}
        return []
    }
    
}
extension UsersAnimesController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchAnimes().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userAnimeTable.dequeueReusableCell(withIdentifier: "user_anime_cell", for: indexPath) as! UserAnimeCell
        let animes = fetchAnimes()[indexPath.row]
        cell.animeTitle.text = animes.title
        cell.animeReleaseDate.text = animes.releaseDate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ReviewVC = storyboard.instantiateViewController(withIdentifier: "review_page")
        if let unwrappedVC = ReviewVC as? ReviewController{
            unwrappedVC.signedUsername = signedUsername
            unwrappedVC.animeTitle = fetchAnimes()[indexPath.row].title
            unwrappedVC.reviewTextView = fetchAnimes()[indexPath.row].review
        }
        self.navigationController?.pushViewController(ReviewVC, animated: true)
    }
    
}
extension UsersAnimesController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (a, v, handler) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ReviewVC = storyboard.instantiateViewController(withIdentifier: "review_page")
            if let unwrappedVC = ReviewVC as? ReviewController{
                unwrappedVC.signedUsername = self.signedUsername
                unwrappedVC.animeTitle = self.fetchAnimes()[indexPath.row].title
                unwrappedVC.reviewTextView = self.fetchAnimes()[indexPath.row].review
                unwrappedVC.isEditingReview = true
            }
            self.navigationController?.pushViewController(ReviewVC, animated: true)
        }
        edit.backgroundColor = .systemIndigo
        let config = UISwipeActionsConfiguration(actions: [edit])
        
        
        return config
    }
}
