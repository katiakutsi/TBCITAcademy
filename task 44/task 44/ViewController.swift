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
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServiceEnabled()
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
