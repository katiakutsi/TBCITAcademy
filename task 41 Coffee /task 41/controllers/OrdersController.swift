//
//  OrdersController.swift
//  task 41
//
//  Created by katia kutsi on 6/16/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class OrdersController: UIViewController {
    
    @IBOutlet weak var ordersTable: UITableView!
    @IBOutlet weak var tabBarView: UIView!
    
    lazy var homeViewController: HomeViewController = {
        let storyboard = UIStoryboard(name: "Order", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
    }()
    
    var orders = [Coffee]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ordersTable.delegate = self
        ordersTable.dataSource = self
        ordersTable.rowHeight = 120
        
        tabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBarView.layer.cornerRadius = 30

        NotificationCenter.default.addObserver(
        self,
        selector: #selector(didRecieveInfo(with:)),
        name: .InfoID,
        object: nil)
                
        print(orders)
    }
    
    @IBAction func onHome(_ sender: UIButton) {
        homeViewController.view.isHidden = false
    }
    
    @objc func didRecieveInfo(with notification : Notification){
        if let userInfo = notification.userInfo{
            
            let coffee = Coffee(image: userInfo["image"] as! UIImage, coffeeName: userInfo["name"] as! String)
            orders.append(coffee)
            
            ordersTable.reloadData()
        }
    }
    
    
    private func addViewControllerAsChildViewController(childViewController: UIViewController){
        addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
    }
}

extension OrdersController : UITableViewDelegate{}
extension OrdersController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ordersTable.dequeueReusableCell(withIdentifier: "orders_cell", for: indexPath) as! OrderCell
        
        let order = orders[indexPath.row]
        cell.coffeeImv.image = order.image
        cell.coffeeName.text = order.coffeeName
        
        return cell
    }
}

