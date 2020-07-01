//
//  ViewController.swift
//  task 50
//
//  Created by katia kutsi on 7/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var square: UIView!
    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var dampingLabel: UILabel!
    @IBOutlet weak var velocityLabel: UILabel!
    @IBOutlet weak var rotateLabel: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var scaleLabel: UILabel!
    @IBOutlet weak var animationsPicker: UIPickerView!
    
    
    var isCircle = false
    var options = false
    var heightConstraint : NSLayoutConstraint!
    
    let animations = [["shake", "pop", "squeeze"],
           ["easeIn", "easeOut", "easeInOut"]]
    
    override func loadView() {
        super.loadView()
        
        optionsView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            optionsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            optionsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            optionsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
        
        animationsPicker.delegate = self
        animationsPicker.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        square.layer.cornerRadius = 10
    
        heightConstraint = NSLayoutConstraint(item: optionsView as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0)
        self.view.addConstraint(heightConstraint)
    }

    @IBAction func cornerRadiusChanger(_ sender: UIButton) {
        if !isCircle{
            UIView.animate(withDuration: 1) {
                self.square.layer.cornerRadius = self.square.frame.width/2
            }
            isCircle = true
            sender.setTitle("Make Square", for: .normal)
        }else {
            UIView.animate(withDuration: 1) {
                self.square.layer.cornerRadius = 10
            }
            isCircle = false
            sender.setTitle("Make Circle", for: .normal)

        }
        
    }
    @IBAction func optionsButton(_ sender: UIButton) {
        if !options {
            self.heightConstraint.constant = 306
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: [], animations: {
                self.view.layoutIfNeeded()
            })
            options = true
        }else {
            self.heightConstraint.constant = 0
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: [], animations: {
                self.view.layoutIfNeeded()
            })
            options = false
        }
        
    }
    
    @IBAction func dampingSlider(_ sender: UISlider){
        let damping = Float(1.00)
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: CGFloat(damping * sender.value), initialSpringVelocity: 5, options: [], animations: {
            self.square.transform = CGAffineTransform(rotationAngle: CGFloat(sender.value * 180))
            self.square.bounds.size = CGSize(width: Int(150.00 * sender.value), height: Int(150 * sender.value))
        }) { (f) in
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: CGFloat(damping * sender.value), initialSpringVelocity: 5, options: [], animations: {
                self.square.transform = .identity
                self.square.bounds.size.width = 150
                self.square.bounds.size.height = 150
            }) { (f) in
                
            }
        }
        dampingLabel.text = "Damping : " + String(format: "%.1f", sender.value )
    }
    
    @IBAction func velocitySlider(_ sender: UISlider) {
        let velocity = Float(1.00)
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: CGFloat(velocity * sender.value), options: [], animations: {
            self.square.transform = CGAffineTransform(rotationAngle: CGFloat(sender.value * 180))
            self.square.bounds.size = CGSize(width: Int(150.00 * sender.value), height: Int(150 * sender.value))
        }) { (f) in
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: CGFloat(velocity * sender.value), options: [], animations: {
                self.square.transform = .identity
                self.square.bounds.size.width = 150
                self.square.bounds.size.height = 150
            }) { (f) in
                
            }
        }
        velocityLabel.text = "Velocity : " + String(format: "%.1f", sender.value )
    }
    
    @IBAction func rotateSlider(_ sender: UISlider) {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.square.transform = CGAffineTransform(rotationAngle: CGFloat(sender.value * 180))
            self.square.bounds.size = CGSize(width: Int(150.00 * sender.value), height: Int(150 * sender.value))
        }) { (f) in
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                self.square.transform = .identity
                self.square.bounds.size.width = 150
                self.square.bounds.size.height = 150
            }) { (f) in
                
            }
        }
        rotateLabel.text = "Rotate : " + String(format: "%.1f", sender.value )
    }
    
    @IBAction func xSlider(_ sender: UISlider) {

        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.square.frame.origin.x =  CGFloat(sender.value)
        }) { (f) in
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                self.square.bounds.origin = CGPoint(x: 132, y: 294)
            }) { (f) in
                
            }
        }
        xLabel.text = "x : " + String(format: "%.1f", sender.value )
    }
    
    @IBAction func ySlider(_ sender: UISlider) {
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.square.frame.origin.y =  CGFloat(sender.value)
        }) { (f) in
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                self.square.frame.origin = CGPoint(x: 132, y: 294)
            }) { (f) in
                
            }
        }
        yLabel.text = "y : " + String(format: "%.1f", sender.value )
    }
    
    @IBAction func scaleSlider(_ sender: UISlider) {
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.square.bounds.size = CGSize(width: Int(150.00 * sender.value), height: Int(150 * sender.value))
        }) { (f) in
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                self.square.bounds.size.width = 150
                self.square.bounds.size.height = 150
            }) { (f) in
                
            }
        }
        scaleLabel.text = "Scale : " + String(format: "%.1f", sender.value )
    }
    

    func shake(){
        let midX = square.center.x
        let midY = square.center.y

        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.06
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: midX - 10, y: midY)
        animation.toValue = CGPoint(x: midX + 10, y: midY)
        square.layer.add(animation, forKey: "position")
    }
    
    func pop(){
        square.transform = CGAffineTransform(scaleX: 0.8, y: 1.2)

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [],  animations: {
          self.square.transform = .identity
        })
    }
    
    func squeeze(){
        UIView.animate(withDuration: 0.6,
        animations: {
            self.square.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.6) {
                self.square.transform = CGAffineTransform.identity
            }
        })
    }
    
}

extension ViewController : UIPickerViewDelegate {}
extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return animations[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 && row == 0 {
            if component == 0 {
                switch row {
                case 0:
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                        self.shake()
                    })
                case 1:
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                        self.shake()
                    })
                case 2:
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                        self.shake()
                    })
                default:
                    print("")
                }
            }
        }
        
        if component == 0 && row == 0 {
            if component == 0 {
                switch row {
                case 0:
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                        self.shake()
                    })
                case 1:
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                        self.shake()
                    })
                case 2:
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                        self.shake()
                    })
                default:
                    print("")
                }
            }
        }
        
        if component == 0 && row == 1 {
            if component == 0 {
                switch row {
                case 0:
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                        self.pop()
                    })
                case 1:
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                        self.pop()
                    })
                case 2:
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                        self.pop()
                    })
                default:
                    print("")
                }
            }
        }
        
        if component == 0 && row == 2 {
            if component == 0 {
                switch row {
                case 0:
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                        self.squeeze()
                    })
                case 1:
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                        self.squeeze()
                    })
                case 2:
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                        self.squeeze()
                    })
                default:
                    print("")
                }
            }
        }
    }
    
}
