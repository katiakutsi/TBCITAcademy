//
//  ViewController.swift
//  task 39
//
//  Created by katia kutsi on 6/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onShowAlert(_ sender: UIButton) {
        showAlert()
    }
    
    private func showAlert(){
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "დახურვა", style: .cancel)
        
        let icon = UIImage(named: "icon")
        let imageView = UIImageView()
        imageView.image = icon
        imageView.frame = CGRect(x: 120, y: 25, width: 25, height: 25)
        alert.view.addSubview(imageView)
        
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 75, width: alert.view.frame.size.width - 170, height: 20)
        label.text = "საკაიფო ტექსტი"
        label.textAlignment = .center
        alert.view.addSubview(label)
        
        let height = NSLayoutConstraint(item: alert.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200)
        alert.view.addConstraint(height)
        
                
        
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    
}

