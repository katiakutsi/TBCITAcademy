//
//  ViewController.swift
//  task_24
//
//  Created by katia kutsi on 5/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

struct MusicalGroup : Codable {
    var name : String
    var imgUrl : String
    var info : String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var groups = [MusicalGroup]()
    var currentBandName = ""
    var currentBandInfo = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "BandCell", bundle: Bundle.main), forCellWithReuseIdentifier: "band_cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        get(){
            print("")
        }
        
    }

    func get(completion: @escaping ()->()){
        let url = URL(string: "http://www.mocky.io/v2/5ec3ab0f300000850039c29e")!
        URLSession.shared.dataTask(with: url){ (data, res, err) in
            
            do {
                let groupsArray = try JSONSerialization.jsonObject(with: data!) as! [[String:String]]
                for group in groupsArray {
                    let name = group["name"] ?? ""
                    let imgUrl = group["img_url"] ?? ""
                    let info = group["info"] ?? ""
                    self.groups.append(MusicalGroup(name: name, imgUrl: imgUrl, info: info))
                    DispatchQueue.main.async {
                        completion()
                        self.collectionView.reloadData()
                    }
                }
            } catch { print (error) }
        }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "segue_for_band"{
            if let BandVC = segue.destination as? BandViewController{
                BandVC.bandNameForSegue = currentBandName
                BandVC.bandBioForSegue = currentBandInfo
            }
        }
    }

}

extension ViewController : UICollectionViewDelegate{}
extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "band_cell", for: indexPath) as! BandCell
        cell.bandName.text = groups[indexPath.row].name
        groups[indexPath.row].imgUrl.downloadImage{ (image) in
            DispatchQueue.main.async {
                cell.bandImage.image = image
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentBandName = groups[indexPath.row].name
        currentBandInfo = groups[indexPath.row].info
        performSegue(withIdentifier: "segue_for_band", sender: nil)
    }
    
}
extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWith = collectionView.frame.width / 2
        return CGSize(width: itemWith - 20 - 20, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 5, left: 10, bottom: 0, right: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}

extension String {
    
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: self) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
        }.resume()
    }
    
}
