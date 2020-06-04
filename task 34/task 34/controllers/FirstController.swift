//
//  ViewController.swift
//  task 34
//
//  Created by katia kutsi on 6/4/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class FirstController: UIViewController {

    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skipButton.addTextSpacing(spacing: 5)
        
        stackView.arrangedSubviews.forEach { (v) in
            v.layer.cornerRadius = 7
        }
    }


}

extension UIButton{
  func addTextSpacing(spacing: CGFloat){
    let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
  attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: (self.titleLabel?.text!.count)! - 1))
    self.setAttributedTitle(attributedString, for: .normal)
  }
}
