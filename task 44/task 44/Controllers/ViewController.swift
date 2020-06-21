//
//  ViewController.swift
//  task 44
//
//  Created by katia kutsi on 6/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var showForecastOutlet: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var apiService = APIService()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServiceEnabled()
        
        showForecastOutlet.layer.cornerRadius = 20
        
        activityIndicator.startAnimating()
        
        
        
        if let lat = locationManager.location?.coordinate.latitude, let lon = locationManager.location?.coordinate.longitude {
            
            apiService.getCurrentWeather(lat: lat, lon: lon, completion: { (weather) in
                DispatchQueue.main.async {
                            
                    let iconCode = weather.weather[0].icon
                            
                    let url = "http://openweathermap.org/img/wn/\(iconCode)@2x.png"
                
                    url.downloadImage { (image) in
                        DispatchQueue.main.async {
                            self.weatherIcon.image = image

                        }
                    }
                            
                    self.city.text = weather.name
                    self.temp.text = String(describing: Int(weather.main.temp - 272.15)) + "°C"
                    self.weatherDescription.text = weather.weather[0].weatherDescription.uppercased()
                    self.humidity.text = "Humidity : " + String(describing: weather.main.humidity) + "%"
                    self.pressure.text = "Pressure : " + String(describing: weather.main.pressure)
                    self.maxTemp.text = "Maximum Temp : " + String(describing: Int(weather.main.tempMax - 272.15)) + "°C"
                    self.minTemp.text = "Maximum Temp : " + String(describing: Int(weather.main.tempMin - 272.15)) + "°C"
                            
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                }
            })
        } else {
            
        }
        
        
        
    }
    @IBAction func showForecast(_ sender: UIButton) {
    }
    
    private func checkLocationServiceEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkAuthorizationStatus()
        }
    }
    
    private func setupLocationManager() {
           locationManager.delegate = self
           locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .authorizedAlways:
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
        case .restricted:
            break
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
}
