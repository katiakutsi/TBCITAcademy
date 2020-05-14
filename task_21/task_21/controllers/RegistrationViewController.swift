//
//  RegistrationViewController.swift
//  task_21
//
//  Created by katia kutsi on 5/14/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var newUsername: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(try! FileManager.default.url(for: .documentationDirectory, in: .allDomainsMask, appropriateFor: nil, create: false))
    }
    
    @IBAction func newRegistrationButton(_ sender: Any) {
        save()
        self.navigationController?.popViewController(animated: true)
    }
    
    func save(){
        let context = AppDelegate.coreDataContainer.viewContext
        let user = User(context: context)
        user.username = newUsername.text
        user.password = newPassword.text
        do{
            try context.save()
        }catch {}
        print("saved")
    }
    
}
