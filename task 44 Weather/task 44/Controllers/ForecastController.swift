//
//  ForecastController.swift
//  task 44
//
//  Created by katia kutsi on 6/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreLocation

class ForecastController: UIViewController {
    @IBOutlet weak var forecastTableView: UITableView!

    let viewModel = ViewModel()
    
    let locationManager = CLLocationManager()


    
    var weathers = [(String,Weather)]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastTableView.delegate = self
        forecastTableView.dataSource = self
        forecastTableView.rowHeight = 110
        
       
        if let lat = locationManager.location?.coordinate.latitude, let lon = locationManager.location?.coordinate.longitude{
            viewModel.getObjects (lat, lon, { (objects) in
                self.weathers.append(contentsOf: objects)
                DispatchQueue.main.async {
                    self.forecastTableView.reloadData()
                }
            })
        }
        
                
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

extension ForecastController : UITableViewDelegate{ }

extension ForecastController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        let weekdays = Array(NSOrderedSet(array: weathers.map { $0.0 })) as! [String]
        return weekdays.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let weekdays = Array(NSOrderedSet(array: weathers.map { $0.0 })) as! [String]
        for i in 0..<weekdays.count {
          if section == i {
            return weathers.filter({$0.0 == weekdays[i]}).count
          }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = forecastTableView.dequeueReusableCell(withIdentifier: "forecast_cell", for: indexPath) as! ForecastCell
        
        var weather : Weather?

        
        let weekdays = Array(NSOrderedSet(array: weathers.map { $0.0 })) as! [String]
        
        for i in 0..<weekdays.count {
            if indexPath.section == i {
                weather = weathers.filter({$0.0 == weekdays[i]})[indexPath.row].1
          }
        }
        

        let iconCode = weather!.weather[0].icon

        let url = "http://openweathermap.org/img/wn/\(iconCode)@2x.png"

        url.downloadImage { (image) in
            DispatchQueue.main.async {
                cell.weatherIcon.image = image
            }
        }

        let dateAndTime = weather!.date!.split(separator: " ")

        cell.time.text = String(String(dateAndTime.last!).dropLast(3))
        cell.temperature.text = String(describing: Int(weather!.main.temp - 272.15)) + "°C"
        cell.weatherDescription.text = weather!.weather[0].weatherDescription
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        
        let weekdays = Array(NSOrderedSet(array: weathers.map { $0.0 })) as! [String]
        
        for i in 0..<weekdays.count {
          if section == i {
            label.text = weekdays[i]
          }
        }
        
        label.backgroundColor = .lightGray
        return label
    }
}
