//
//  MasterViewController.swift
//  task 41
//
//  Created by katia kutsi on 6/16/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var homeOutlet: UIButton!
    
    lazy var homeViewController: HomeViewController = {
        let storyboard = UIStoryboard(name: "Order", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
    }()
    
    lazy var ordersViewController: OrdersController = {
        let storyboard = UIStoryboard(name: "MyOrder", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "OrdersController") as! OrdersController
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBarView.layer.cornerRadius = 30
        
        homeOutlet.alpha = 0.2
        
        homeViewController.view.isHidden = false
    }
    
    @IBAction func onHomePage(_ sender: UIButton) {
        homeViewController.view.isHidden = false
        ordersViewController.view.isHidden = true

    }
    @IBAction func onOrdersPage(_ sender: UIButton) {
        homeViewController.view.isHidden = true
        ordersViewController.view.isHidden = false
        sender.alpha = 0.2
    }
    
    private func addViewControllerAsChildViewController(childViewController: UIViewController){
        addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
    }

}
