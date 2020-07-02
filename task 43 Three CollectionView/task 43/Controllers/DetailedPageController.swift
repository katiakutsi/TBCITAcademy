//
//  DetailedPageController.swift
//  task 43
//
//  Created by katia kutsi on 6/18/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class DetailedPageController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var color: UIView!
    @IBOutlet weak var imv: UIImageView!
    @IBOutlet weak var info: UITextView!
    
    var objName: String?
    var objColor: String?
    var objImv: UIImage?
    var objInfo: String?
    var currentBand: Band?
    var currentChar: Character?
    var currentColor: Color?
    var clickedObj: clickedObj?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        color.backgroundColor = .clear
        
        switch clickedObj {
        case .band:
        name.text = currentBand?.name
        info.text = currentBand?.info
        currentBand?.imgUrl.downloadImage(completion: { (image) in
            DispatchQueue.main.async {
                self.imv.image = image
            }
        })
        case .character:
        name.text = currentChar?.name
        info.text = "Status :  \(currentChar!.status) \nSpecies : \(currentChar!.species) \nGender : \(currentChar!.gender)"
        currentChar?.image.downloadImage(completion: { (image) in
            DispatchQueue.main.async {
                self.imv.image = image
            }
        })
        case .color:
            color.backgroundColor = UIColor(hex: currentColor?.code ?? "")
            name.text = currentColor?.name
            info.text = currentColor?.code
            imv.image = .none
            
        default:
            print("")
        }
        
    }

}
