//
//  ViewController.swift
//  Competition 4
//
//  Created by katia kutsi on 6/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let apiService = APIService()
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.backgroundColor = .clear
        
        apiService.getUsers { (users) in
            self.users.append(contentsOf: users.users)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    func alert (){
        let alert = UIAlertController(title: "Saved", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in alert.dismiss(animated: true, completion: nil) }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func savePhoto(img:UIImage, name:String){
        
        let url = try! FileManager.default.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        let newFile = url.appendingPathComponent("\(name).png")
        print(url)
        
        try! img.pngData()?.write(to: newFile)
        print("Success")
    }
    @IBAction func onButton(_ sender: UIButton) {
        performSegue(withIdentifier: "seg", sender: self)
    }
}



extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 20 , height: 300)
    }
}
extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.name.text = users[indexPath.row].user.name
        
        users[indexPath.row].urls.regular.downloadImage { (image) in
            DispatchQueue.main.async {
                cell.imv.image = image
            }
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let optionMenu = UIAlertController(title: nil, message: "Save Photo", preferredStyle: .actionSheet)
        let rawPhoto = UIAlertAction(title: "Raw", style: .default) { (k) in
            self.users[indexPath.row].urls.raw.downloadImage { (img) in
                self.savePhoto(img: img!, name: "Raw_\(self.users[indexPath.row].user.name)")
            }
            self.alert()
        }
        let fullPhoto = UIAlertAction(title: "Full", style: .default) { (k) in
            self.users[indexPath.row].urls.full.downloadImage { (img) in
                self.savePhoto(img: img!, name: "Full_\(self.users[indexPath.row].user.name)")
            }
            self.alert()
        }
        let regularPhoto = UIAlertAction(title: "Regular", style: .default) { (k) in
            self.users[indexPath.row].urls.regular.downloadImage { (img) in
                self.savePhoto(img: img!, name: "Regular_\(self.users[indexPath.row].user.name)")
            }
            self.alert()
        }
        let smallPhoto = UIAlertAction(title: "Small", style: .default) { (k) in
            self.users[indexPath.row].urls.small.downloadImage { (img) in
                self.savePhoto(img: img!, name: "Small_\(self.users[indexPath.row].user.name)")
            }
            self.alert()
        }
        let thumbPhoto = UIAlertAction(title: "Thumb", style: .default) { (k) in
            self.users[indexPath.row].urls.thumb.downloadImage { (img) in
                self.savePhoto(img: img!, name: "Thumb_\(self.users[indexPath.row].user.name)")
            }
            self.alert()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        optionMenu.addAction(rawPhoto)
        optionMenu.addAction(fullPhoto)
        optionMenu.addAction(regularPhoto)
        optionMenu.addAction(smallPhoto)
        optionMenu.addAction(thumbPhoto)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
}

