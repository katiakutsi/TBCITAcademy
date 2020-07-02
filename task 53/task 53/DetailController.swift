//
//  DetailController.swift
//  task 53
//
//  Created by katia kutsi on 7/3/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var imv: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    var nameOnLabel : String?
    var descOnLabel : String?
    var photo = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imv.layer.cornerRadius = 10
        
        imv.image = photo
        name.text = nameOnLabel
        desc.text = descOnLabel
    }
    
}
