//
//  ViewController.swift
//  task 38
//
//  Created by katia kutsi on 6/10/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

class DrawingView: UIView{
    
    var lines = [[CGPoint]]()
    let circle = CALayer()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath()
        
        lines.forEach { (line) in
            for (index, point) in line.enumerated() {
                if index == 0 {
                    path.move(to: point)
                } else {
                    path.addLine(to: point)
                    self.layer.addSublayer(circle)
                    
                    circle.frame = CGRect(x: point.x - 25, y: point.y - 25, width: 50, height: 50)
                }
            }
        }
    
        
        let lineLayer = CAShapeLayer()
        lineLayer.path = path.cgPath
        lineLayer.strokeColor = UIColor(red: 74/255, green: 45/255, blue: 231/255, alpha: 1).cgColor
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.lineWidth = 10
        lineLayer.lineCap = .round
        
        lineLayer.path = path.cgPath
        self.layer.addSublayer(lineLayer)
        
        circle.backgroundColor = UIColor.clear.cgColor
        circle.borderColor = UIColor.black.cgColor
        circle.borderWidth = 2
        circle.cornerRadius = circle.frame.width/2
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())

    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        circle.removeFromSuperlayer()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: nil)
        
        guard var lastLine = lines.popLast() else {return}
        lastLine.append(location)
        
        lines.append(lastLine)
        
        setNeedsDisplay()
    }
    
}
