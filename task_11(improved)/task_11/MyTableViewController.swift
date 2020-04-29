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
    
    var size = 0
    
    var usersInList = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension MyTableViewController : UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return size
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: "my_cell", for: indexPath) as! CustomTableViewCell
    

        cell.fnameInCell?.text = usersInList[indexPath.row].userFname
        cell.lnameInCell?.text = usersInList[indexPath.row].userLname
        cell.emailInCell?.text = usersInList[indexPath.row].userEmail
        

        return cell
    }
    
    
}
