//
//  ThirdController.swift
//  task 34
//
//  Created by katia kutsi on 6/4/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ThirdController: UIViewController {
    @IBOutlet weak var getStarted: UIButton!
    @IBOutlet weak var thridStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getStarted.addTextSpacing(spacing: 5)
        getStarted.layer.cornerRadius = 10
        getStarted.layer.borderWidth = 2
        let color = UIColor(hex: "#1D247C")
        getStarted.layer.borderColor = color?.cgColor
            
        thridStackView.arrangedSubviews.forEach { (v) in
            v.layer.cornerRadius = 7
        }
    }

}
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    a = CGFloat(1.0)
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
