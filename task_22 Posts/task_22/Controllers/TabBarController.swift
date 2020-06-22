//
//  TabBarController.swift
//  task_22
//
//  Created by katia kutsi on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {


    var user: UserStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HomeVC = self.viewControllers![0] as! HomeViewController
        HomeVC.currentUser = user
        
        let ProfileVC = self.viewControllers![1] as! ProfileViewController
        ProfileVC.user = user
    }
    
}

