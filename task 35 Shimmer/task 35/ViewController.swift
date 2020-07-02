//
//  ViewController.swift
//  task 35
//
//  Created by katia kutsi on 6/5/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var characters = [Character]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.showAnimatedGradientSkeleton()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 210

        getCharacters(){
            self.view.hideSkeleton()
        }
    }
    
    override func viewDidLayoutSubviews() {
        view.layoutSkeletonIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.layoutIfNeeded()
        tableView.showAnimatedGradientSkeleton()
        
    }
 
    
    func getCharacters(completion: @escaping ()->()) {
        
        let url = URL(string: "https://rickandmortyapi.com/api/character/")!
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let charactersResponse = try decoder.decode(CharactersResponse.self, from: data)
                                
                self.characters.append(contentsOf: charactersResponse.characters)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {print(error)}
            
        }.resume()
    }
}

