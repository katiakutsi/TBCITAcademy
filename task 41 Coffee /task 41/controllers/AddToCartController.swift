//
//  AddToCartController.swift
//  task 41
//
//  Created by katia kutsi on 6/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class AddToCartController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var addToCartOutlet: UIButton!
    
    @IBOutlet weak var coffeName: UILabel!
    @IBOutlet weak var coffeeImage: UIImageView!
    

    var orders = [Coffee]()
    
    var name: String?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImage.layer.cornerRadius = 30
        addToCartOutlet.layer.cornerRadius = 28
        
        coffeName.text = name
        coffeeImage.image = image
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        let orderName = coffeName.text
        let orderImage = coffeeImage.image
        orders.append(Coffee(image: orderImage!, coffeeName: orderName!))
        
        let coffee = ["image": orderImage!,
                      "name" : orderName!] as [String : Any]
        NotificationCenter.default.post(name: .InfoID, object: nil, userInfo: coffee)
        
        self.navigationController?.popViewController(animated: true)
    }

}
