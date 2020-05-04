//
//  ViewController.swift
//  task_14
//
//  Created by katia kutsi on 5/4/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let firstView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .systemIndigo
        return v
    }()
    
    let secondView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .systemPink
        return v
    }()
    
    let heightField : UITextField = {
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.backgroundColor = .systemGray6
        return t
    }()
    
    let widthField : UITextField = {
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.backgroundColor = .systemGray6
        return t
    }()
    
    let changeDimensions : UIButton = {
        let b = UIButton()
        b.setTitle("Change", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .systemBlue
        b.addTarget(self, action: #selector(change), for: .touchUpInside)
        return b
    }()
    
    let dragUp : UIButton = {
        let b = UIButton()
        b.setTitle("UP", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(up), for: .touchUpInside)
        b.backgroundColor = .systemGreen
        return b
    }()
    
    let dragDown : UIButton = {
        let b = UIButton()
        b.setTitle("DOWN", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(down), for: .touchUpInside)
        b.backgroundColor = .systemGreen
        return b
    }()
    
    let dragLeft : UIButton = {
        let b = UIButton()
        b.setTitle("LEFT", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(left), for: .touchUpInside)

        b.backgroundColor = .systemGreen
        return b
    }()
    
    let dragRight : UIButton = {
        let b = UIButton()
        b.setTitle("RIGHT", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(right), for: .touchUpInside)
        b.backgroundColor = .systemGreen
        return b
    }()
   
    var slider : UISlider = {
        let s = UISlider()
        s.maximumValue = 200
        s.minimumValue = 0
        s.value = 100
        s.translatesAutoresizingMaskIntoConstraints = false
        s.addTarget(self, action: #selector(forSlider), for: .touchUpInside)
        return s
    }()
    
    var firstViewBottomConstraint : NSLayoutConstraint!
    var secondViewBottomConstraint : NSLayoutConstraint!
    var firstViewLeadingConstraint : NSLayoutConstraint!
    var secondViewTrailingConstraint : NSLayoutConstraint!
    var firstViewHeightConstraint : NSLayoutConstraint!
    var firstViewWidthConstraint : NSLayoutConstraint!
    var SecondViewHeightConstraint : NSLayoutConstraint!
    var SecondViewWidthConstraint : NSLayoutConstraint!
    
    var tapOnFirstView : UITapGestureRecognizer!
    var tapOnSecondView : UITapGestureRecognizer!
    var tapped : Bool!
    
    override func loadView() {
        super.loadView()
        view.addSubview(firstView)
        view.addSubview(secondView)
        view.addSubview(heightField)
        view.addSubview(widthField)
        view.addSubview(changeDimensions)
        view.addSubview(dragUp)
        view.addSubview(dragDown)
        view.addSubview(dragLeft)
        view.addSubview(dragRight)
        view.addSubview(slider)
   
        NSLayoutConstraint.activate([
            //firstView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            //firstView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            //firstView.widthAnchor.constraint(equalToConstant: 100),
            //firstView.heightAnchor.constraint(equalToConstant: 100),
            
            //secondView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            //secondView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            //secondView.widthAnchor.constraint(equalToConstant: 100),
            //secondView.heightAnchor.constraint(equalToConstant: 100),
        ])
 
        NSLayoutConstraint.activate([
            heightField.bottomAnchor.constraint(equalTo: dragUp.topAnchor, constant: -150),
            heightField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            heightField.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            heightField.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
            
            widthField.bottomAnchor.constraint(equalTo: dragUp.topAnchor, constant: -150),
            widthField.leadingAnchor.constraint(equalTo: heightField.trailingAnchor, constant: 20),
            widthField.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            widthField.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
            
            changeDimensions.bottomAnchor.constraint(equalTo: dragUp.topAnchor, constant: -150),
            changeDimensions.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            changeDimensions.widthAnchor.constraint(greaterThanOrEqualToConstant: 80),
            changeDimensions.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
            
        ])
        

        NSLayoutConstraint.activate([
            slider.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            slider.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
            dragDown.topAnchor.constraint(equalTo: slider.topAnchor, constant: -100),
            dragDown.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            dragDown.heightAnchor.constraint(equalToConstant: 80),
            dragDown.widthAnchor.constraint(equalToConstant: 80),
            
            dragUp.bottomAnchor.constraint(equalTo: dragDown.topAnchor, constant: -100),
            dragUp.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            dragUp.heightAnchor.constraint(equalToConstant: 80),
            dragUp.widthAnchor.constraint(equalToConstant: 80),
            
            dragLeft.bottomAnchor.constraint(equalTo: dragDown.topAnchor, constant: -10),
            dragLeft.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60),
            dragLeft.heightAnchor.constraint(equalToConstant: 80),
            dragLeft.widthAnchor.constraint(equalToConstant: 80),
            
            dragRight.bottomAnchor.constraint(equalTo: dragDown.topAnchor, constant: -10),
            dragRight.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -60),
            dragRight.heightAnchor.constraint(equalToConstant: 80),
            dragRight.widthAnchor.constraint(equalToConstant: 80)

        ])

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapOnFirstView = UITapGestureRecognizer(target: self, action: #selector(onButton))
        firstView.addGestureRecognizer(tapOnFirstView)
        tapOnSecondView = UITapGestureRecognizer(target: self, action: #selector(onButton))
        secondView.addGestureRecognizer(tapOnSecondView)
        view.isUserInteractionEnabled = true
        
        
        
        firstViewBottomConstraint = NSLayoutConstraint(item: firstView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 50)
        self.view.addConstraint(firstViewBottomConstraint)
        
        secondViewBottomConstraint = NSLayoutConstraint(item: secondView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 50)
        self.view.addConstraint(secondViewBottomConstraint)
        
        firstViewLeadingConstraint = NSLayoutConstraint(item: firstView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50)
        self.view.addConstraint(firstViewLeadingConstraint)

        secondViewTrailingConstraint = NSLayoutConstraint(item: secondView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50)
        self.view.addConstraint(secondViewTrailingConstraint)
        
        firstViewHeightConstraint = NSLayoutConstraint(item: firstView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        self.view.addConstraint(firstViewHeightConstraint)

        firstViewWidthConstraint = NSLayoutConstraint(item: firstView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        self.view.addConstraint(firstViewWidthConstraint)
        
        SecondViewHeightConstraint = NSLayoutConstraint(item: secondView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        self.view.addConstraint(SecondViewHeightConstraint)
        
        SecondViewWidthConstraint = NSLayoutConstraint(item: secondView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        self.view.addConstraint(SecondViewWidthConstraint)

    }

    @objc func onButton(_ sender : UITapGestureRecognizer){
        if sender == tapOnFirstView{
            tapped = true
        }
        if sender == tapOnSecondView {
            tapped = false
        }
    }
    
    @objc func up(){
        if tapped == true {
            firstViewBottomConstraint.constant -= 10
        }
        if tapped == false{
            secondViewBottomConstraint.constant -= 10
        }
    }
    
    @objc func down(){
        if tapped == true {
            firstViewBottomConstraint.constant += 10
        }
        if tapped == false{
            secondViewBottomConstraint.constant += 10
        }
    }
    
    @objc func left(){
        if tapped == true {
            firstViewLeadingConstraint.constant -= 10
        }
        if tapped == false{
            secondViewTrailingConstraint.constant -= 10
        }
    }
    
    @objc func right(){
        if tapped == true {
            firstViewLeadingConstraint.constant += 10
        }
        if tapped == false{
            secondViewTrailingConstraint.constant += 10
        }
    }
    
    @objc func change(){
        if tapped == true {
            if let doubleValue = Double(heightField.text!){
                firstViewHeightConstraint.constant = CGFloat(doubleValue)
            }
            if let doubleValue = Double(widthField.text!){
                firstViewWidthConstraint.constant = CGFloat(doubleValue)
            }
        }
        if tapped == false{
            if let doubleValue = Double(heightField.text!){
                SecondViewHeightConstraint.constant = CGFloat(doubleValue)
            }
            if let doubleValue = Double(widthField.text!){
                SecondViewWidthConstraint.constant = CGFloat(doubleValue)
            }
        }
    }
    
    @objc func forSlider(){
        if tapped == true {
            firstViewHeightConstraint.constant = CGFloat(slider.value)
            firstViewWidthConstraint.constant = CGFloat(slider.value)
        }
        if tapped == false {
            SecondViewHeightConstraint.constant = CGFloat(slider.value)
            SecondViewWidthConstraint.constant = CGFloat(slider.value)
        }
    }

}

