//
//  ViewController.swift
//  task 43
//
//  Created by katia kutsi on 6/18/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bandsCollectionView: UICollectionView!
    @IBOutlet weak var rickAndMortyCollectionView: UICollectionView!
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    
    var bands = [Band]()
    var characters = [Character]()
    var colors = [Color]()
    
    var currentBand: Band?
    var currentChar: Character?
    var currentColor: Color?
    
    var clickedObj: clickedObj?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bandsCollectionView.delegate = self
        bandsCollectionView.dataSource = self
        
        rickAndMortyCollectionView.delegate = self
        rickAndMortyCollectionView.dataSource = self
        
        colorsCollectionView.delegate = self
        colorsCollectionView.dataSource = self
        
        getBands() {}
        getCharacters() {}
        getColors()
    }

    
    func getBands(completion: @escaping ()->()){
        let url = URL(string: "http://www.mocky.io/v2/5ec3ab0f300000850039c29e")!
        URLSession.shared.dataTask(with: url){ (data, res, err) in
        
            do {
                let groupsArray = try JSONSerialization.jsonObject(with: data!) as! [[String:String]]
                for group in groupsArray {
                    let name = group["name"] ?? ""
                    let imgUrl = group["img_url"] ?? ""
                    let info = group["info"] ?? ""
                    self.bands.append(Band(name: name, imgUrl: imgUrl, info: info))
                    DispatchQueue.main.async {
                        completion()
                        self.bandsCollectionView.reloadData()
                    }
                }
            } catch { print (error) }
        }.resume()
        
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
                    self.rickAndMortyCollectionView.reloadData()
                }
                
            } catch {print(error)}
            
        }.resume()
    }
    
    func getColors(){
        let url = URL(string: "https://reqres.in/api/unknown")!
        
        URLSession.shared.dataTask(with: url){ (data, res, er) in
            guard let data = data else{return}
            
            do{
                let decoder = JSONDecoder()
                let colorsResponse = try decoder.decode(ColorsResponse.self, from: data)
                self.colors.append(contentsOf: colorsResponse.colors)
                DispatchQueue.main.async {
                    self.colorsCollectionView.reloadData()
                }
            }catch{print(error.localizedDescription)}
            
        }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "segue"{
            if let DetailedPageVC = segue.destination as? DetailedPageController{
                DetailedPageVC.currentChar = currentChar
                DetailedPageVC.currentBand = currentBand
                DetailedPageVC.currentColor = currentColor
                DetailedPageVC.clickedObj = clickedObj
            }
        }
    }
    
    
}

extension ViewController : UICollectionViewDelegate{}

extension ViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return bands.count
        } else if collectionView.tag == 1 {
            return characters.count
            } else {
            return colors.count
            }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            let bandsCell = bandsCollectionView.dequeueReusableCell(withReuseIdentifier: "BandsCell", for: indexPath) as! BandsCell

            bandsCell.bind(band: bands[indexPath.row])

            return bandsCell
        } else if collectionView.tag == 1 {

            let charactersCell = rickAndMortyCollectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharacterCell

            charactersCell.bind(character: characters[indexPath.row])

            return charactersCell
        } else{
            let colorsCell = colorsCollectionView.dequeueReusableCell(withReuseIdentifier: "ColorsCell", for: indexPath) as! ColorsCell

            colorsCell.bind(color: colors[indexPath.row])

            return colorsCell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {


        if collectionView.tag == 0 {
            currentBand = bands[indexPath.row]
            clickedObj = .band
        }else if collectionView.tag == 1 {
            currentChar = characters[indexPath.row]
            clickedObj = .character
        }else {
            currentColor = colors[indexPath.row]
            clickedObj = .color
        }
        
        performSegue(withIdentifier: "segue", sender: nil)
    }

}

extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: bandsCollectionView.frame.width / 2 + 25 , height: collectionView.frame.height)
    }
    
}

enum clickedObj {
    case band
    case color
    case character
}
