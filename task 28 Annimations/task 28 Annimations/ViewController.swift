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
    
    var imv = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 40, y: UIScreen.main.bounds.height, width: 80, height: 80))

    
    var objArr = [Object(icon: UIImage(named: "bucket"), title: "Beach games"),
                  Object(icon: UIImage(named: "beach"), title: "Ironing board"),
                  Object(icon: UIImage(named: "coconut"), title: "Cocktail mood"),
                  Object(icon: UIImage(named: "beach-ball"), title: "Beach ball")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 90
        view.addSubview(imv)

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
