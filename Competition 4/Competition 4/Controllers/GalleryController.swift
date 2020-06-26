//
//  GalleryController.swift
//  Competition 4
//
//  Created by katia kutsi on 6/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class GalleryController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension GalleryController : UITableViewDelegate {}
extension GalleryController  :UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        return cell
    }
    
}
