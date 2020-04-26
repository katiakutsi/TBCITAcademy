//
//  ViewController.swift
//  task_8.2
//
//  Created by katia kutsi on 4/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signinButton(_ sender: UIButton) {
        if username.text == "username" && password.text == "qwerty" {
            let alert = UIAlertController(title: "", message: "თქვენ წარმატებით გაიარეთ ავტორიზაცია", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "დახურვა", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }else{
            let alert = UIAlertController(title: "", message: "სამწუხაროთ თქვენ ვერგაიარეთ ავტორიზაცია", preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "დახურვა", style: .cancel, handler: nil))
                       self.present(alert, animated: true)
        }
    }
    
}

