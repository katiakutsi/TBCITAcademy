//
//  ViewController.swift
//  task 33
//
//  Created by katia kutsi on 6/3/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawRect()

    }

    func drawRect(){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 300, height: 200))
        
        let image = renderer.image { (ctx) in
            let rectangle = CGRect(x: 0, y: 0, width: 300, height: 200)
            
            ctx.cgContext.setFillColor(UIColor.yellow.cgColor)
            ctx.cgContext.setStrokeColor(UIColor(red: 106/255, green: 233/255, blue: 194/255, alpha: 1).cgColor)
            ctx.cgContext.setLineWidth(25)
            
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        imageView.image = image
    }
    

}

