//
//  RegistrationVC.swift
//  task16
//
//  Created by katia kutsi on 5/6/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit



class RegistrationVC: UIViewController {
    
    
    @IBOutlet weak var emailForRegistration: UITextField!
    @IBOutlet weak var usernameForRegistration: UITextField!
    @IBOutlet weak var passwordForRegistration: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registrationButton(_ sender: UIButton) {
        if emailForRegistration.text == "" || usernameForRegistration.text == "" || passwordForRegistration.text == "" {
            let alert = UIAlertController(title: "", message: "შეავსეთ ყველა ველი", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "დახურვა", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
        
    
    }

}

