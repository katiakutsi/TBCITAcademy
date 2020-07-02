//
//  ViewController.swift
//  task 37
//
//  Created by katia kutsi on 6/9/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var square: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCircle()
    }
    
    private func setUpCircle(){
        
        let vitriol = UIColor(red: 46/255, green: 198/255, blue: 172/255, alpha: 1)
        let darkerVitriol = UIColor(red: 60/255, green: 170/255, blue: 154/255, alpha: 1)
        let gray =  UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        
        square.backgroundColor = vitriol
        
        let firstCircleLayer = CALayer()
        firstCircleLayer.backgroundColor = darkerVitriol.cgColor
        firstCircleLayer.frame = CGRect(x: 0, y: 0, width: circle.frame.width, height: circle.frame.height)
        
        circle.layer.addSublayer(firstCircleLayer)
        circle.layer.cornerRadius = circle.frame.width/2
        firstCircleLayer.cornerRadius = firstCircleLayer.frame.width/2
        
        let secondCircleLayer = CALayer()
        secondCircleLayer.backgroundColor = UIColor.white.cgColor
        secondCircleLayer.bounds = CGRect(x: 0, y: 0, width: circle.frame.width - 80, height: circle.frame.height - 80)
        secondCircleLayer.position = CGPoint(x: circle.layer.bounds.midX, y: circle.layer.bounds.midY)
        secondCircleLayer.borderColor = gray.cgColor
        secondCircleLayer.borderWidth = 5

        
        circle.layer.addSublayer(secondCircleLayer)
        secondCircleLayer.cornerRadius = secondCircleLayer.frame.width/2
        
    }

}

