//
//  CallsViewController.swift
//  task_17
//
//  Created by katia kutsi on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class CallsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var callerContacts = [ CallerContact(phoneNumber: "+995345837435", country: "Georgia",                        date: "06.05.2020"),
                           CallerContact(phoneNumber: "+995568374657", country: "Georgia", date: "05.05.2020"),
                           CallerContact(phoneNumber: "+422389474235", country: "Spain", date: "04.05.2020"),
                           CallerContact(phoneNumber: "+995563524132", country: "Georgia", date: "03.05.2020"),
                           CallerContact(phoneNumber: "+995548675263", country: "Georgia", date: "02.05.2020"),
                           CallerContact(phoneNumber: "+345283754245", country: "France", date: "01.05.2020"),
                           CallerContact(phoneNumber: "+995384756283", country: "Georgia", date: "30.04.2020"),
                           CallerContact(phoneNumber: "+995537482734", country: "Georgia", date: "29.04.2020"),
                           CallerContact(phoneNumber: "+995537292736", country: "Georgia", date: "28.04.2020"),
                           CallerContact(phoneNumber: "+995273847637", country: "Georgia", date: "27.04.2020"),
                           CallerContact(phoneNumber: "+947362849474", country: "Spain", date: "26.04.2020"),
                           CallerContact(phoneNumber: "+392837465859", country: "France", date: "25.04.2020"),
                           CallerContact(phoneNumber: "+422389474235", country: "USA", date: "24.04.2020"),
                           CallerContact(phoneNumber: "+345283754245", country: "Canada", date: "23.04.2020")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    

}
extension CallsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return callerContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calls_cell", for: indexPath) as! CallsCell
        cell.phoneNumber.text = callerContacts[indexPath.row].phoneNumber
        cell.country.text = callerContacts[indexPath.row].country
        cell.date.text = callerContacts[indexPath.row].date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

extension CallsViewController : UITableViewDelegate{
    
}

struct CallerContact{
    var phoneNumber : String?
    var country : String?
    var date : String?
}
