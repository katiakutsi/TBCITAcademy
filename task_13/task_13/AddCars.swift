//
//  AddCars.swift
//  task_13
//
//  Created by katia kutsi on 5/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

protocol CarsProtocol{
    func carsToTable(array : [Car])
}
class AddCars: UIViewController {

    @IBOutlet weak var photosTableView: UITableView!
    @IBOutlet weak var inputCar: UITextField!
    @IBOutlet weak var inputPrice: UITextField!
    
    var delegate: CarsProtocol?
    
    var newCars = [Car]()
    var carPhotos = ["toy_car_1", "toy_car_2", "toy_car_3", "toy_car_4", "toy_car_5"]
    var carPictureName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        photosTableView.delegate = self
        photosTableView.dataSource = self
    }
    
    @IBAction func addCarButton(_ sender: UIButton) {
        let model = inputCar.text ?? ""
        let price = inputPrice.text ?? ""
        
        let newCar = Car(model: model, price: price, ImageName: carPictureName )
        newCars.append(newCar)
        delegate?.carsToTable(array: newCars)
        
        clearFields()
    }
    private func clearFields(){
        inputCar.text = ""
        inputPrice.text = ""
    }
}
extension AddCars : UITableViewDelegate {}

extension AddCars : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = photosTableView.dequeueReusableCell(withIdentifier: "photos_cell", for: indexPath) as! PhotosCell
        cell.carPhoto.image = UIImage(named: carPhotos[indexPath.row])
 
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCar = carPhotos[indexPath.row]
        carPictureName = selectedCar
    }
}
