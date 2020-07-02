//
//  ViewController.swift
//  task 53
//
//  Created by katia kutsi on 7/2/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var geckos = [Gecko]()
    var selectedGecko = Gecko()
    
    
    let imvs = [
            UIImage(named: "1"),
            UIImage(named: "2"),
            UIImage(named: "3"),
            UIImage(named: "4"),
            UIImage(named: "5"),
            UIImage(named: "6")
    ]
    
    let names = [
            "An adorable Leapord Gecko",
            "Incredibly Cute Gecko",
            "Cute Gecko Of The Day",
            "White Crested Gecko",
            "White Gecko",
            "Happy Girl"
    ]
    
    let descr = [
                 "Geckos are small lizards belonging to the infraorder Gekkota, found in warm climates throughout the world.",
                 "Geckos are unique among lizards for their vocalizations, which differs from species to species.",
                 "Most geckos in the family Gekkonidae use chirping or clicking sounds in their social interactions, tokay geckos (Gekko gecko) are known for their loud mating calls, and some other species are capable of making hissing noises when alarmed or threatened.",
                 "All geckos except species in the family Eublepharidae lack eyelids; instead, the outer surface of the eyeball has a transparent membrane, the cornea.",
                 "Like most lizards, geckos can lose their tails in defense, a process called autotomy.",
                 "Most geckos cannot blink, but they often lick their eyes to keep them clean and moist."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        save()
        geckos = fetch()
        

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
          layout.delegate = self
        }
        
    }

    func save(){
        let context = AppDelegate.coreDataContainer.viewContext
        
        for i in 0...imvs.count-1{
            let gecko = Gecko(context: context)
            gecko.name = names[i]
            gecko.descr = descr[i]
            if let binaryImage = imvs[i]!.pngData() {
                gecko.photo = binaryImage
            }
        }
        do{
            try context.save()
        }catch {}
    }
    
    func fetch() -> [Gecko]{
        let context = AppDelegate.coreDataContainer.viewContext
        let request: NSFetchRequest<Gecko> = Gecko.fetchRequest()
                
        do{
            let result = try context.fetch(request)
            let geckos = result as [Gecko]
            
            return geckos
            
        }catch{}
        return []
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "segue" {
            if let DetailVC = segue.destination as? DetailController {
                if let imageData = selectedGecko.photo{
                    DetailVC.photo = UIImage(data: imageData)!
                }
                DetailVC.nameOnLabel = selectedGecko.name
                DetailVC.descOnLabel = selectedGecko.descr
                
            }
        }
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
}
extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return geckos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.bind(gecko: geckos[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedGecko = geckos[indexPath.row]
        performSegue(withIdentifier: "segue", sender: nil)
    }
    
}

extension ViewController: PinterestLayoutDelegate {
    func collectionView(
      _ collectionView: UICollectionView,
      heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    
        var imv = UIImage()
        if let imageData = geckos[indexPath.item].photo {
            imv = UIImage(data: imageData)!
        }
        return imv.size.height/2
  }
}
