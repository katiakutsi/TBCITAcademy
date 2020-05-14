//
//  ViewController.swift
//  task_21
//
//  Created by katia kutsi on 5/14/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var signedUser: User?
    
    var users = [UserStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func authorisationButton(_ sender: Any) {
        fetch()
        var userExist = false
        for item in users{
            if let username = item.username{
                if let password = item.password{
                    if username == usernameField.text && password == passwordField.text{
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let NotesVC = storyboard.instantiateViewController(withIdentifier: "notes_page") as! NotesViewController
                        NotesVC.signedUser = item 
                        self.navigationController?.pushViewController(NotesVC, animated: true)
                        userExist = true
                        break
                    }
                }
            }
        }
        if !userExist{
            let alert = UIAlertController(title: "", message: "სამწუხაროდ თქვენ ვერ გაიარეთ ავტორიზაცია", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "დახურვა", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func fetch(){
        let context = AppDelegate.coreDataContainer.viewContext
        let user = User(context: context)
        let request: NSFetchRequest<User> = User.fetchRequest()
        do{
            let result = try context.fetch(request)
            guard let users = result as? [User] else {return}
            for item in users{
                if let user = item as? User{
                    if let username = user.username{
                        if let password = user.password{
                        self.users.append(UserStruct(username: username, password: password))
                        }
                    }
                }
            }
        }catch{}
    }

}
struct UserStruct{
    var username: String?
    var password: String?
}
