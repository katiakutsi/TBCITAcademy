//
//  ViewController.swift
//  task_27
//
//  Created by katia kutsi on 5/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calculate(_ sender: UIButton) {

        DispatchQueue.main.async{
            sender.isEnabled = false
            sender.setTitle("Caluclating...", for: .normal)
        }

        DispatchQueue.global(qos: .userInteractive).async{
            self.printPrimeNumbers()
            DispatchQueue.main.async {
                self.datePicker.isUserInteractionEnabled = true
            }
            DispatchQueue.global(qos: .userInteractive).async{
                DispatchQueue.main.async {
                    sender.isEnabled = true
                    sender.setTitle("Calculate Prime Numbers", for: .normal)
                }
            }
        }
    }
    
    func printPrimeNumbers(){
        for number in 1...10000{
            var prime = true
            if number > 1{
                for i in 2..<number {
                    if number % i == 0{
                        prime = false
                        break
                    }
                }
                if prime == true{
                    print(number)
                }
            }
        }
    }
}

