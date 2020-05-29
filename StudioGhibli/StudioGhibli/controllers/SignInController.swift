//
//  ViewController.swift
//  StudioGhibli
//
//  Created by katia kutsi on 5/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import TextFieldEffects
import Kingfisher
import CoreData


class SignInController: UIViewController  {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInOutlet: UIButton!
    @IBOutlet weak var signUpOutlet: UIButton!
    @IBOutlet weak var imv: UIImageView!
    
    var url = URL(string: "https://i.pinimg.com/564x/69/57/40/6957405dd18042ad3f59e930f608a1a8.jpg")
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInOutlet.layer.cornerRadius = 30
        signUpOutlet.layer.cornerRadius = 30
        
        imv.kf.setImage(with: url)
    }
    @IBAction func signInButton(_ sender: UIButton) {
        var userExist = false
        
        for item in fetchUsers(){
            if item.username == self.usernameField.text && item.password == self.passwordField.text{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let UsersAnimesVC = storyboard.instantiateViewController(withIdentifier: "users_animes_page") as! UsersAnimesController
                UsersAnimesVC.signedUsername = item.username
                self.navigationController?.pushViewController(UsersAnimesVC, animated: true)
                usernameField.text = ""
                passwordField.text = ""
                userExist = true
                break
            }
        }
        
        if !userExist{
            let alert = UIAlertController(title: "", message: "სამწუხაროდ თქვენ ვერ გაიარეთ ავტორიზაცია", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "დახურვა", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        usernameField.text = ""
        passwordField.text = ""
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
}
