//
//  RecordsViewController.swift
//  task_19
//
//  Created by katia kutsi on 5/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class RecordsViewController: UIViewController, RecordsToPreviousPage {
    

    @IBOutlet weak var tableView: UITableView!
    
    var folderName: String?
    
    var indexNeeded = -1
    
    var records = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchRecords()
    }
    
    private func fetchRecords(){
        records.removeAll()
        let folderNameForFiles = folderName ?? ""
        let fm = FileManager.default
        let docsUrl = try! fm.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        let folderPath = docsUrl.appendingPathComponent(folderNameForFiles)
        let arr = try! fm.contentsOfDirectory(at: folderPath, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        
        for recordPath in arr where recordPath.pathExtension == "txt"{
            let record = try! String(contentsOf: recordPath)
            //print(record)
            records.append(record)
        }
        
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "segue_for_add_records" {
            
            if let AddRecrdsVC = segue.destination as? AddRecordsViewController {
                AddRecrdsVC.recrodsToPreviusPageDelegate = self
                AddRecrdsVC.folderName = self.folderName
            }
        }
    }
    func recordToPreviusPage() {
        fetchRecords()
    }
    

}

extension RecordsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
           let delete = UIContextualAction(style: .destructive, title: "Delete") { (a, v, handler) in
                self.records.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
           }
        
        let edit = UIContextualAction(style: .normal, title: "Edit"){ (actiib, view, handler) in
            self.indexNeeded = indexPath.row
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let AddVC = storyboard.instantiateViewController(withIdentifier: "add_record")
            if let unwrappedVC = AddVC as? AddRecordsViewController{
                unwrappedVC.shouldEditRecord = self.records[indexPath.row]
            }
            self.navigationController?.pushViewController(AddVC, animated: true)
        }
        edit.backgroundColor = .systemIndigo
           
           let config = UISwipeActionsConfiguration(actions: [delete, edit])
           
           return config
       }
}

extension RecordsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "records_cell", for: indexPath) as! RecordsCell
        cell.recordLabel.text = records[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
