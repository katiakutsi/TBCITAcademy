//
//  SettingsViewController.swift
//  task_22
//
//  Created by katia kutsi on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logOutButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
