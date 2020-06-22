//
//  ViewController.swift
//  task_23
//
//  Created by katia kutsi on 5/18/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

struct Color : Codable{
    let id : Int
    let name : String
    let year : Int
    var code : String
    let pantoneValue: String

    enum CodingKeys : String, CodingKey{
        case id
        case name
        case year
        case code = "color"
        case pantoneValue = "pantone_value"
    }
}

struct ColorsResponse : Codable{
    
    let colors : [Color]
    
    enum CodingKeys : String, CodingKey{
        case colors = "data"
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var colors = [Color]()
    
    var cellColor = UIColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ColorCell", bundle: Bundle.main), forCellWithReuseIdentifier: "color_cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        get()
    }

    
    func get(){
        let url = URL(string: "https://reqres.in/api/unknown")!
        
        URLSession.shared.dataTask(with: url){ (data, res, er) in
            guard let data = data else{return}
            
            do{
                let decoder = JSONDecoder()
                let colorsResponse = try decoder.decode(ColorsResponse.self, from: data)
                self.colors.append(contentsOf: colorsResponse.colors)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }catch{print(error.localizedDescription)}
            
        }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "segue_for_next"{
            if let NextVC = segue.destination as? NextViewController{
                NextVC.storyboardColor = cellColor
            }
        }
    }
}

extension ViewController : UICollectionViewDelegate{}
extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "color_cell", for: indexPath) as! ColorCell
        cell.colorCode.text = colors[indexPath.row].code
        cell.colorName.text = colors[indexPath.row].name
        cell.backgroundColor = UIColor(hex: colors[indexPath.row].code)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellColor = UIColor(hex: colors[indexPath.row].code)!
        performSegue(withIdentifier: "segue_for_next", sender: nil)
    }
    
    
}
extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.frame.width / 2
        let itemHeight = collectionView.frame.height / 3
        return CGSize(width: itemWidth, height: itemHeight )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    a = CGFloat(1.0)
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
