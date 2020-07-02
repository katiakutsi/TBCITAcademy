//
//  ViewController.swift
//  task 41
//
//  Created by katia kutsi on 6/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import Localize

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var changeLanguageOutlet: UIButton!
    
    var language = 0
    
    lazy var ordersViewController: OrdersController = {
        let storyboard = UIStoryboard(name: "MyOrder", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "OrdersController") as! OrdersController
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
    }()
    
    var coffees = [
        Coffee(image: UIImage(named: "Espresso")!, coffeeName: "Espresso"),
        Coffee(image: UIImage(named: "Cappuccino")!, coffeeName: "Cappuccino"),
        Coffee(image: UIImage(named: "macciato")!, coffeeName: "Macciato"),
        Coffee(image: UIImage(named: "Mocha")!, coffeeName: "Mocha"),
        Coffee(image: UIImage(named: "latte")!, coffeeName: "Latte")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        
        tabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBarView.layer.cornerRadius = 30
        
       
        
        changeLanguageOutlet.layer.cornerRadius = 10
        
    }
    
    @IBAction func onOrders(_ sender: UIButton) {
        ordersViewController.view.isHidden = false
    }
    
    @IBAction func changeLanguage(_ sender: UIButton) {
        
        let localize = Localize.shared
        
        if language == 0 {
            localize.update(language: "ge")
            
            coffees = [
                Coffee(image: UIImage(named: "Espresso")!, coffeeName: "ესპრესო"),
                Coffee(image: UIImage(named: "Cappuccino")!, coffeeName: "კაპუჩინო"),
                Coffee(image: UIImage(named: "macciato")!, coffeeName: "მაჩიატო"),
                Coffee(image: UIImage(named: "Mocha")!, coffeeName: "მოკა"),
                Coffee(image: UIImage(named: "latte")!, coffeeName: "ლატე")
            ]
            language = 1
        } else {
            localize.update(language: "en")
            coffees = [
                Coffee(image: UIImage(named: "Espresso")!, coffeeName: "Espresso"),
                Coffee(image: UIImage(named: "Cappuccino")!, coffeeName: "Cappuccino"),
                Coffee(image: UIImage(named: "macciato")!, coffeeName: "Macciato"),
                Coffee(image: UIImage(named: "Mocha")!, coffeeName: "Mocha"),
                Coffee(image: UIImage(named: "latte")!, coffeeName: "Latte")
            ]
            language = 0
        }
        
        
        
        tableView.reloadData()
    }
    
    private func addViewControllerAsChildViewController(childViewController: UIViewController){
        addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
    }
}

extension HomeViewController : UITableViewDelegate {}

extension HomeViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coffee_cell", for: indexPath) as! CoffeeCell
        let coffee = coffees[indexPath.row]
        cell.imv.image = coffee.image
        cell.name.text = coffee.coffeeName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Order", bundle: nil)
        let AddCartVC = storyboard.instantiateViewController(withIdentifier: "add_cart_page")
        if let unwrappedVC = AddCartVC as? AddToCartController{
            unwrappedVC.name = coffees[indexPath.row].coffeeName
            unwrappedVC.image = coffees[indexPath.row].image
        }
        self.navigationController?.pushViewController(AddCartVC, animated: true)
    }
}
