//
//  ViewController.swift
//  task 28 Annimations
//
//  Created by katia kutsi on 5/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var outletButton: UIButton!
    
    var imv = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 40, y: UIScreen.main.bounds.height, width: 80, height: 80))
    let label = UILabel(frame: CGRect(x: 200, y: -70, width: 100, height: 21))
    let myView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
    
    let imv1 = UIImageView(frame: CGRect(x: 2, y: 120, width: 50, height: 50))
    let imv2 = UIImageView(frame: CGRect(x: 62, y: 120, width: 50, height: 50))
    let imv3 = UIImageView(frame: CGRect(x: 122, y: 120, width: 50, height: 50))
    let imv4 = UIImageView(frame: CGRect(x: 182, y: 120, width: 50, height: 50))
    let imv5 = UIImageView(frame: CGRect(x: 242, y: 120, width: 50, height: 50))
    let imv6 = UIImageView(frame: CGRect(x: 302, y: 120, width: 50, height: 50))
    let imv7 = UIImageView(frame: CGRect(x: 362, y: 120, width: 50, height: 50))
    
    
    var objArr = [Object(icon: UIImage(named: "bucket"), title: "Beach games"),
                  Object(icon: UIImage(named: "beach"), title: "Ironing board"),
                  Object(icon: UIImage(named: "coconut"), title: "Cocktail mood"),
                  Object(icon: UIImage(named: "beach-ball"), title: "Beach ball")]
    
    var secObjArr = [Object(icon: UIImage(named: "ice-cream"), title: "Ice Cream"),
                     Object(icon: UIImage(named: "sun"), title: "Sun"),
                     Object(icon: UIImage(named: "beach-ball"), title: "Beach ball"),
                     Object(icon: UIImage(named: "swimsuit"), title: "Swim Suit for Him"),
                     Object(icon: UIImage(named: "bikini"), title: "Swim Suit for Her"),
                     Object(icon: UIImage(named: "bucket"), title: "Beach games"),
                     Object(icon: UIImage(named: "beach"), title: "Ironing board")]
    
    var tapOnImageView1 : UITapGestureRecognizer!
    var tapOnImageView2 : UITapGestureRecognizer!
    var tapOnImageView3 : UITapGestureRecognizer!
    var tapOnImageView4 : UITapGestureRecognizer!
    var tapOnImageView5 : UITapGestureRecognizer!
    var tapOnImageView6 : UITapGestureRecognizer!
    var tapOnImageView7 : UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 90
        view.addSubview(imv)
        
        label.text = "Select Item!"
        
        myView.addSubview(label)
        myView.backgroundColor = .systemGray6
        view.isUserInteractionEnabled = true

        tapOnImageView1 = UITapGestureRecognizer(target: self, action: #selector(onImage))
        tapOnImageView2 = UITapGestureRecognizer(target: self, action: #selector(onImage))
        tapOnImageView3 = UITapGestureRecognizer(target: self, action: #selector(onImage))
        tapOnImageView4 = UITapGestureRecognizer(target: self, action: #selector(onImage))
        tapOnImageView5 = UITapGestureRecognizer(target: self, action: #selector(onImage))
        tapOnImageView6 = UITapGestureRecognizer(target: self, action: #selector(onImage))
        tapOnImageView7 = UITapGestureRecognizer(target: self, action: #selector(onImage))
        
        imv1.addGestureRecognizer(tapOnImageView1)
        imv2.addGestureRecognizer(tapOnImageView2)
        imv3.addGestureRecognizer(tapOnImageView3)
        imv4.addGestureRecognizer(tapOnImageView4)
        imv5.addGestureRecognizer(tapOnImageView5)
        imv6.addGestureRecognizer(tapOnImageView6)
        imv7.addGestureRecognizer(tapOnImageView7)

        imv1.isUserInteractionEnabled = true
        imv2.isUserInteractionEnabled = true
        imv3.isUserInteractionEnabled = true
        imv4.isUserInteractionEnabled = true
        imv5.isUserInteractionEnabled = true
        imv6.isUserInteractionEnabled = true
        imv7.isUserInteractionEnabled = true

    }
    @objc func onImage(_ sender : UITapGestureRecognizer){
        if sender == tapOnImageView1 {
            objArr.append(secObjArr[0])
            tableView.reloadData()
            
        }
        if sender == tapOnImageView2 {
            objArr.append(secObjArr[1])
            tableView.reloadData()
        }
        if sender == tapOnImageView3 {
            objArr.append(secObjArr[2])
            tableView.reloadData()
        }
        if sender == tapOnImageView4 {
            objArr.append(secObjArr[3])
            tableView.reloadData()
        }
        if sender == tapOnImageView5 {
            objArr.append(secObjArr[4])
            tableView.reloadData()
        }
        if sender == tapOnImageView6 {
            objArr.append(secObjArr[5])
            tableView.reloadData()
        }
        if sender == tapOnImageView7 {
            objArr.append(secObjArr[6])
            tableView.reloadData()
        }
        
        
        UIView.transition(with: self.myView, duration: 1, options: .transitionFlipFromBottom, animations: {
        }, completion: nil)

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.55, initialSpringVelocity: 15, options: [], animations: {
            self.myView.alpha = 0
        }) { (f) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.55, initialSpringVelocity: 15, options: [], animations: {
                self.tableView.frame.origin.y = 80
                self.outletButton.setTitle("+", for: .normal)
            }) { (f) in
            }
        }
    }
    
    @IBAction func addbutton(_ sender: UIButton) {
        self.myView.alpha = 1
        view.addSubview(myView)
        
        UIView.animate(withDuration: 0.5,delay: 0, usingSpringWithDamping: 0.55, initialSpringVelocity: 15, animations: {
            self.tableView.frame.origin.y = 200
            self.label.frame.origin.y = 70
            self.label.frame.origin.x = 50
            self.outletButton.setTitle("x", for: .normal)
            self.myView.frame.size.height = 200
            
        }) { (f) in
            
        }
        UIView.animate(withDuration: 1, animations: {
            self.imv1.image = self.secObjArr[0].icon
            self.imv2.image = self.secObjArr[1].icon
            self.imv3.image = self.secObjArr[2].icon
            self.imv4.image = self.secObjArr[3].icon
            self.imv5.image = self.secObjArr[4].icon
            self.imv6.image = self.secObjArr[5].icon
            self.imv7.image = self.secObjArr[6].icon

            self.myView.addSubview(self.imv1)
            self.myView.addSubview(self.imv2)
            self.myView.addSubview(self.imv3)
            self.myView.addSubview(self.imv4)
            self.myView.addSubview(self.imv5)
            self.myView.addSubview(self.imv6)
            self.myView.addSubview(self.imv7)

            
        }) { (f) in
        }
    }
}

struct Object{
    var icon: UIImage?
    var title: String?
}

extension ViewController : UITableViewDelegate{}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let arr = objArr[indexPath.row]
        cell.imv.image = arr.icon
        cell.label.text = arr.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.imv.image = self.objArr[indexPath.row].icon!
        self.imv.frame.origin.y = UIScreen.main.bounds.height
        self.imv.alpha = 1
    
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.01, options: [], animations: {
            self.imv.frame.origin.y = 500
        }) { (f) in
            
            UIView.transition(with: self.imv, duration: 1, options: .transitionFlipFromBottom, animations: {
            }, completion: nil)

            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.imv.alpha = 0
            }) { (f) in
            }
        }
       
    }
}
