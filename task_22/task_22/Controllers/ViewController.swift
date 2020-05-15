//
//  ViewController.swift
//  task_22
//
//  Created by katia kutsi on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var signedUser: User?
    var users = [UserStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(try! FileManager.default.url(for: .documentationDirectory, in: .allDomainsMask, appropriateFor: nil, create: false))
    }

    @IBAction func signInButton(_ sender: UIButton) {
        fetch()
        for item in users{
            print(item)
        }
        var userExist = false
        for item in users{
            if let username = item.username{
                if let password = item.password{
                    if username == self.username.text && password == self.password.text{
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let tabBar = storyboard.instantiateViewController(withIdentifier: "tab_bar_page") as! TabBarController
                        tabBar.user = item
                        self.navigationController?.pushViewController(tabBar, animated: true)
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
                    if let firstname = user.firstName{
                        if let lastName = user.lastName{
                            if let username = user.username{
                                if let email = user.email{
                                    if let password = user.password{
                                        if let profilePicture = user.profilePicture {
                                            let image = UIImage(data: profilePicture)
                                            self.users.append(UserStruct(firstName: firstname, lastName: lastName, username: username, profilePicture: image, password: password, email: email))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }catch{}
    }
    
}
struct UserStruct{
    var firstName: String?
    var lastName: String?
    var username: String?
    var profilePicture: UIImage?
    var password: String?
    var email: String?
}

