//
//  InfoViewController.swift
//  country_search
//
//  Created by katia kutsi on 5/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var borders: UILabel!
    
    var countryNameFor: String?
    var capitalFor: String?
    var regionFor: String?
    var currencyFor: String?
    var bordersFor: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryName.text = countryNameFor
        capital.text = capitalFor
        region.text = regionFor
        currency.text = currencyFor
        borders.text = bordersFor
    }


}
