//
//  ImageController.swift
//  Competition 4
//
//  Created by katia kutsi on 6/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ImageController: UIViewController {
    @IBOutlet weak var imv: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
