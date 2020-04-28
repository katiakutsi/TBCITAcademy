//
//  ViewController.swift
//  task_10
//
//  Created by katia kutsi on 4/28/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var oneProductQuantity: UITextField!
    
    @IBOutlet weak var price: UITextField!
    
    @IBOutlet weak var type: UIPickerView!
    
    @IBOutlet weak var quantity: UILabel!
    
    var counter = 0
    
    var nArray = [String]()
    var qArray = [Int]()
    var pArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func addition(_ sender: UIButton) {
        counter += 1
        quantity.text = String(counter)
        
    }
    @IBAction func calculate(_ sender: UIButton) {
        let inputQuantity: Int? = Int(oneProductQuantity.text!)
        let inputPrice: Int? = Int(price.text!)
        
        qArray.append(inputQuantity!)
        let qSum = qArray.reduce(0, +)

        pArray.append(inputPrice!)
        let pSum = pArray.reduce(0, +)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let InfoVC   = storyboard.instantiateViewController(withIdentifier: "info_page")

        if let realInfoVC = InfoVC as? InfoViewController{
            realInfoVC.priceLabel = String(pSum)
            realInfoVC.quantityLabel = String(qSum)

        }
        self.navigationController?.pushViewController(InfoVC, animated: true)
    }
}

