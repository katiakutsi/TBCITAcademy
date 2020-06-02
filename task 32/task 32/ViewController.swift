//
//  ViewController.swift
//  task 32
//
//  Created by katia kutsi on 6/2/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tasks = [
    Activity(circle: UIImage(named: "1"), activity: "Playing on the piano", time: (16,21)),
    Activity(circle: UIImage(named: "2"), activity: "Study math", time: (16, 22)),
    Activity(circle: UIImage(named: "3"), activity: "Clean the room", time: (16,23)),
    Activity(circle: UIImage(named: "4"), activity: "Read a book", time: (16,24)),
    Activity(circle: UIImage(named: "5"), activity: "Go to grocerys", time: (16, 25))
    ]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 73
        
        let center  = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, err) in
            if granted{
                print("დაეთანხმა")
            } else{
                print("არ დაეთანხმა")
            }
        }
        
        for i in 0...tasks.count - 1{
            
            let content = UNMutableNotificationContent()
            content.title = "Reminder"
            content.body = tasks[i].activity!
            content.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            dateComponents.hour = tasks[i].time!.0
            dateComponents.minute = tasks[i].time!.1
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

            let req = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(req)
            
        }
    }
}

struct Activity {
    var circle: UIImage?
    var activity: String?
    var time: (Int, Int)?
}

extension ViewController : UITableViewDelegate{}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cell
        let activity = tasks[indexPath.row]
        cell.circle.image = activity.circle
        cell.activity.text = activity.activity
        cell.date.text = String(activity.time!.0) + ":" + String(activity.time!.1)
        return cell
    }
    
    
}
