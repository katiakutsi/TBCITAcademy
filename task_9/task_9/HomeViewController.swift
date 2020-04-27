//
//  HomeViewController.swift
//  task_9
//
//  Created by katia kutsi on 4/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var firstNameOnHome: UILabel!
    var firstNameText: String?

    @IBOutlet weak var lastNameOnHome: UILabel!
    var lastNameText: String?
    
    @IBOutlet weak var emailOnHome: UILabel!
    var emailText: String?
    
    @IBOutlet weak var phoneNumberOnHome: UILabel!
    var phoneNumberText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        firstNameOnHome.text = firstNameText
        lastNameOnHome.text = lastNameText
        emailOnHome.text = emailText
        phoneNumberOnHome.text = phoneNumberText
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
