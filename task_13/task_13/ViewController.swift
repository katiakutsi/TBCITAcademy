//
//  ViewController.swift
//  task_13
//
//  Created by katia kutsi on 5/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CarsProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cars = [Car]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let rows = tableView.numberOfRows(inSection: 0)
        let indexPath = IndexPath(row: rows-1, section: 0)
        if rows > 0 {
            tableView.scrollToRow(at: indexPath , at: .bottom, animated: true)
        }
    }
    
    @IBAction func scrollDownButton(_ sender: UIButton) {
        let indexPath = IndexPath(row: cars.count-1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    @IBAction func scrollTopButton(_ sender: UIButton) {
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    @IBAction func addBarButton(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name : "Main" , bundle : nil)
        let addCarsVC = storyboard.instantiateViewController(withIdentifier: "add_cars")
        if let unwrappedVC = addCarsVC as? AddCars{
            unwrappedVC.delegate = self
        }
        self.navigationController?.pushViewController(addCarsVC, animated: true)
    }
               
    func carsToTable(array: [Car]) {
        cars.append(contentsOf : array)
        tableView.reloadData()
    }
    
}

struct Car {
    let model : String
    let price : String
    let ImageName : String
}

extension ViewController : UITableViewDelegate{
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "car_cell", for: indexPath) as! CarTableViewCell
        
        cell.modelLabel.text = cars[indexPath.row].model
        cell.priceLabel.text = cars[indexPath.row].price
        cell.carImage.image = UIImage (named : cars[indexPath.row].ImageName)

        return cell
    }
    
}
