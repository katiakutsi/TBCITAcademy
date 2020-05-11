//
//  ViewController.swift
//  task_19
//
//  Created by katia kutsi on 5/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CreateFolderProtocol {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var folders = [String]()
    
    var records = [String]()
    
    var folderNameNeeded: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "FolderCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "FolderCollectionViewCell")

        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .white
        
        fetchFolders()
    }
    
    private func fetchFolders(){
        folders.removeAll()
        let fm = FileManager.default
        let docsUrl = try! fm.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        print(docsUrl)
        let arr = try! fm.contentsOfDirectory(at: docsUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        for folderPath in arr {
            let folderName = folderPath.lastPathComponent
            folders.append(folderName)
        }
        
        collectionView.reloadData()
    }

    func newFolderFunc() {
        fetchFolders()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "create_folder_segue"{
            if let CreateFolderVC = segue.destination as? CreateFolderViewController{
                CreateFolderVC.createFolderProtocolDelegate = self
            }
        }
        
        if let id = segue.identifier, id == "segue_for_records"{
            if let RecordsVC = segue.destination as? RecordsViewController{
                RecordsVC.folderName = self.folderNameNeeded
            }
        }
    }

}

extension ViewController : UICollectionViewDelegate{
    
}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.folders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FolderCollectionViewCell", for: indexPath) as! FolderCollectionViewCell
        cell.folderNameLabel.text = folders[indexPath.row]
        cell.folderImage.image = UIImage(named: "folder_image")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        folderNameNeeded = folders[indexPath.row]
        performSegue(withIdentifier: "segue_for_records", sender: nil)
        //print(folderNameNeeded)
    }
    
    
}
extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.frame.width / 2
        return CGSize(width: itemWidth - 20 - 20 , height: itemWidth )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 5, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}
