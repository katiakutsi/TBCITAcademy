//
//  ViewController.swift
//  task16
//
//  Created by katia kutsi on 5/6/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UDManager.tappedOrNotOnLogOut() {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main_page")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

    @IBAction func authorisation(_ sender: UIButton) {
        UDManager.tappedOnLogOut()
        
        
        if username.text == "" || password.text == "" {
            let alert = UIAlertController(title: "", message: "შეავსეთ ველები", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "დახურვა", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        
        if username.text != "username" || password.text != "password" {
            let alert = UIAlertController(title: "", message: "სამწუხაროდ თქვენ ვერ გაიარეთ ავტორიზაცია", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "დახურვა", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        
    }
    
    
    
    
}

