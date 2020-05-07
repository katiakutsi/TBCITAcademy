//
//  SettingsViewController.swift
//  task_17
//
//  Created by katia kutsi on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsTableView: UITableView!
    
    var settings = ["Change Name", "Change Password", "Change Theme", "Change Number",  "Help", "Log Out", "Delete Account"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
    }

}
extension SettingsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "setting_cell", for: indexPath) as! SettingsCell
        cell.someSetting.text = settings[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
extension SettingsViewController : UITableViewDelegate{
    
}
