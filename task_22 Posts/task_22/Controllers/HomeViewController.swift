//
//  HomeViewController.swift
//  task_22
//
//  Created by katia kutsi on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITabBarControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [PostStruct]()
    var currentUser: UserStruct?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
        fetch()
        

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetch()
        tableView.reloadData()
    }
    
    func fetch(){
         posts.removeAll()
         let context = AppDelegate.coreDataContainer.viewContext
         let request: NSFetchRequest<Post> = Post.fetchRequest()

         
         do {
             let result = try context.fetch(request)
                    
             guard let posts = result as? [Post] else {return}
                    
             for item in posts{
                 if let p = item as? Post{
                     if let cont = p.content{
                         self.posts.append(PostStruct(content: cont, date: Date()))
                     }
                 }
             }
         } catch {}
     }
    
}
extension HomeViewController : UITableViewDelegate{
    
}
extension HomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "post_cell", for: indexPath) as! TableViewCell
        
        cell.contentOnCell.text = posts[indexPath.row].content
        cell.firstNameOnCell.text = currentUser?.firstName
        cell.lastNameOnCell.text = currentUser?.lastName
        cell.profPictureOnCell.image = currentUser?.profilePicture
        let formatter = DateFormatter()
        let myString = (String(describing: posts[indexPath.row].date))
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let yourDate: Date? = formatter.date(from: myString)
        formatter.dateFormat = "dd-MMM-yyyy"
        cell.dateOnCell.text = myString
        return cell
    }
}
struct PostStruct{
    var content: String?
    var date = Date()
}
