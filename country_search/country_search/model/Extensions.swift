//
//  Extensions.swift
//  country_search
//
//  Created by katia kutsi on 5/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation
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
