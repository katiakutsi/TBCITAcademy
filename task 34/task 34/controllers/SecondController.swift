//
//  SecondController.swift
//  task 34
//
//  Created by katia kutsi on 6/4/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SecondController: UIViewController {
    @IBOutlet weak var secondSkipButton: UIButton!
    @IBOutlet weak var secondStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondSkipButton.addTextSpacing(spacing: 5)
        
        secondStackView.arrangedSubviews.forEach { (v) in
            v.layer.cornerRadius = 7
        }
    }
    
}
