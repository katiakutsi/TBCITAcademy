//
//  MyTabBarController.swift
//  task_17
//
//  Created by katia kutsi on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func loadView() {
        super .loadView()
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        self.selectedIndex = 1
        
        if UDManager.getSegmentIndex() == 3{
            self.selectedIndex = 0
        }else if UDManager.getSegmentIndex() == 4{
            self.selectedIndex = 1
        }else if UDManager.getSegmentIndex() == 5{
            self.selectedIndex = 2
        }else{
            self.selectedIndex = 1
        }
    }
    
}

extension MyTabBarController : UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        UDManager.saveSegmentIndex(value: self.selectedIndex + 3)
    }
}
