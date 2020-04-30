//
//  ViewController.swift
//  task_12
//
//  Created by katia kutsi on 4/30/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController , NewsPageDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var news2 = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    
    @IBAction func onAddBarButton(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name : "Main" , bundle : nil)
        let addNewsVC = storyboard.instantiateViewController(withIdentifier: "add_news")
        if let unwrappedVC = addNewsVC as? AdditionViewController{
            unwrappedVC.delegate = self
        }
        
        self.navigationController?.pushViewController(addNewsVC, animated: true)
    }
    
    func infoToPreviousPage(array : [News]) {
        news2.append(contentsOf : array)
        tableView.reloadData()
    }

}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "news_cell", for: indexPath) as! NewsTableViewCell
                
        cell.titleLabel.text = news2[indexPath.row].title
        cell.desctiptionLabel.text = news2[indexPath.row].content
        cell.imageViewOnCell.image = UIImage(named: "news_image")
        
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    
}
