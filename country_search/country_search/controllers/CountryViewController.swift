//
//  ViewController.swift
//  country_search
//
//  Created by katia kutsi on 5/20/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {
    
    @IBOutlet weak var countryTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let apiService = APIService()
    
    var countries = [Country]()
    var filteredCountries = [Country]()
    
    var currentCountry: Country?

    var indexNeeded = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        countryTable.delegate = self
        countryTable.dataSource = self
        
        apiService.getCountry { (countries) in
            self.countries.append(contentsOf: countries)
            self.filteredCountries.append(contentsOf: countries)
            DispatchQueue.main.async {
                self.countryTable.reloadData()
            }
        }
        
        countryTable.rowHeight = 240
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "segue_for_info"{
            if let InfoVC = segue.destination as? InfoViewController{
                let country = filteredCountries[indexNeeded]
                InfoVC.countryNameFor = country.name
                InfoVC.capitalFor = country.capital
                InfoVC.regionFor = country.region
                InfoVC.currencyFor = country.currencies[0].name
            }
        }
    }
}

extension CountryViewController : UITableViewDelegate{}
extension CountryViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countryTable.dequeueReusableCell(withIdentifier: "country_cell", for: indexPath) as! CountryTableViewCell
        let country = filteredCountries[indexPath.row]
        cell.countryName.text = country.name
        cell.capital.text = country.capital
        var str = ""
        for i in country.borders{
            str = str + i + ", "
        }
        cell.borders.text = str
        cell.currency.text = country.currencies[0].symbol
 
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexNeeded = indexPath.row
        performSegue(withIdentifier: "segue_for_info", sender: nil)
    }

}

extension CountryViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty == false {
            filteredCountries = countries.filter({ $0.name.contains(searchText) || $0.capital.contains(searchText) })
            countryTable.reloadData()
        }else {
            filteredCountries = countries
            countryTable.reloadData()
        }
    }
}
