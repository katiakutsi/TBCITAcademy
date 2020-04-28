//
//  InfoViewController.swift
//  task_10
//
//  Created by katia kutsi on 4/28/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var sumOfQuantity: UILabel!
    var quantityLabel : String?
    
    @IBOutlet weak var SumOfPrice: UILabel!
    var priceLabel : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sumOfQuantity.text = quantityLabel
        SumOfPrice.text = priceLabel
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
