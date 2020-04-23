//
//  ViewController.swift
//  task_7
//
//  Created by katia kutsi on 4/23/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    
    @IBOutlet weak var myDemoTextField1: UITextField!
    
    @IBOutlet weak var myDemoTextField2: UITextField!
    
    
    
    @IBOutlet weak var myDemoLabel: UILabel!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSegmentedControl(_ sender: UISegmentedControl) {
        

    }
    
    @IBAction func onButton(_ sender: UIButton) {
        switch segment.selectedSegmentIndex{
        case 0:
            myDemoLabel.text = String(((myDemoTextField1.text)! as NSString).doubleValue + ((myDemoTextField2.text)! as NSString).doubleValue)
        case 1:
            myDemoLabel.text = String(((myDemoTextField1.text)! as NSString).doubleValue - ((myDemoTextField2.text)! as NSString).doubleValue)
        case 2:
            myDemoLabel.text = String(((myDemoTextField1.text)! as NSString).doubleValue * ((myDemoTextField2.text)! as NSString).doubleValue)
        case 3:
            myDemoLabel.text = String(((myDemoTextField1.text)! as NSString).doubleValue / ((myDemoTextField2.text)! as NSString).doubleValue)
        default:
            print("")
        }
    }
    

    @IBAction func onSlider(_ sender: UISlider) {
        myDemoLabel.font = myDemoLabel.font.withSize(CGFloat(Int(sender.value)))
    }
}

