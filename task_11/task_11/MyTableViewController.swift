//
//  MyTableViewController.swift
//  task_11
//
//  Created by katia kutsi on 4/29/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class MyTableViewController: UIViewController{
  
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}

extension MyTableViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "registration") as! ViewController
        
        return VC.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "my_cell", for: indexPath) as! CustomTableViewCell
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "registration") as! ViewController
               
        cell.fnameInCell?.text = VC.users[indexPath.row].userFname
        cell.lnameInCell?.text = VC.users[indexPath.row].userLname
        cell.emailInCell?.text = VC.users[indexPath.row].userEmail
        
        return cell
    }
    
    
}
