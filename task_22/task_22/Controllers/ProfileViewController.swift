//
//  ProfileViewController.swift
//  task_22
//
//  Created by katia kutsi on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profilePictureOnProfile: UIImageView!
    @IBOutlet weak var firstNameOnProfile: UITextField!
    @IBOutlet weak var lastNameOnProfile: UITextField!
    @IBOutlet weak var usernameOnProfile: UITextField!
    @IBOutlet weak var emailOnProfile: UITextField!
    @IBOutlet weak var passwordOnProfile: UITextField!
    
    var user: UserStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("profile")
        profilePictureOnProfile.image = user?.profilePicture
        firstNameOnProfile.text = user?.firstName
        lastNameOnProfile.text = user?.lastName
        usernameOnProfile.text = user?.username
        emailOnProfile.text = user?.email
        passwordOnProfile.text = user?.password
    }

    @IBAction func updateButton(_ sender: Any) {
        save()
    }
    
    func save(){
        let context = AppDelegate.coreDataContainer.viewContext
        let user = User(context: context)
        user.firstName = firstNameOnProfile.text
        user.lastName = lastNameOnProfile.text
        user.username = usernameOnProfile.text
        user.email = emailOnProfile.text
        user.password = passwordOnProfile.text
        if let binaryImage = profilePictureOnProfile.image?.pngData() {
            user.profilePicture = binaryImage
        }
        do{
            try context.save()
        }catch {}
        print("saved")
    }
    
}
