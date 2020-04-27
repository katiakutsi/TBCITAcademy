//
//  ViewController.swift
//  task_9
//
//  Created by katia kutsi on 4/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    


    }

    @IBAction func onRegistration(_ sender: UIButton) {
        performSegue(withIdentifier: "segue_for_home_page", sender: sender)
    }
    
    override func prepare(for segue : UIStoryboardSegue, sender: Any?){
        if let identifier = segue.identifier{
            
            if identifier == "segue_for_home_page"{
                
                let inputFirstName = firstName.text ?? ""
                let inputLastName = lastName.text ?? ""
                let inputEmail = email.text ?? ""
                let inputPhoneNumber = phoneNumber.text ?? ""
                
                if let homeVC = segue.destination as? HomeViewController{
                    homeVC.firstNameText = inputFirstName
                    homeVC.lastNameText = inputLastName
                    homeVC.emailText = inputEmail
                    homeVC.phoneNumberText = inputPhoneNumber

                }
            }
        }
    }
}

