//
//  TabBarController.swift
//  StudioGhibli
//
//  Created by katia kutsi on 5/28/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    var signedUsername: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let UsersAnimeVC = self.viewControllers![0] as! UsersAnimesController
        UsersAnimeVC.signedUsername = signedUsername
        
    }

}
