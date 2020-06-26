//
//  ViewController.swift
//  task 48
//
//  Created by katia kutsi on 6/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var selectedIndex = -1
    
    let movies = [
        Movie(poster: UIImage(named: "all_about_my_mother")!, movieName: "All About My Mother", movieDescription: "Young Esteban wants to become a writer and also to discover the identity of his second mother, a trans woman, carefully concealed by his mother Manuela."),
        Movie(poster: UIImage(named: "grand_budapest")!, movieName: "The Grand Budapest Hotel", movieDescription: "A writer encounters the owner of an aging high-class hotel, who tells him of his early years serving as a lobby boy in the hotel's glorious years under an exceptional concierge."),
        Movie(poster: UIImage(named: "amelie")!, movieName: "Amélie", movieDescription: "Amélie is an innocent and naive girl in Paris with her own sense of justice. She decides to help those around her and, along the way, discovers love.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 520
    }


}

extension ViewController : UITableViewDelegate { }
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let movie = movies[indexPath.row]
        cell.poster.image = movie.poster
        cell.movieName.text = movie.movieName
        cell.movieDescription.text = movie.movieDescription
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == selectedIndex{
            selectedIndex = -1
        }else{
            selectedIndex = indexPath.row
        }
        tableView.reloadData()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var rowHeight = tableView.rowHeight
        
        if indexPath.row == self.selectedIndex{
            UIView.animate(withDuration: 2 ,delay: 0, options:.curveEaseInOut, animations: {
                rowHeight = rowHeight + 150
            })
        }
        
        return rowHeight
    }
    
}
