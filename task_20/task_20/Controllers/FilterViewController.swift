//
//  FilterViewController.swift
//  task_20
//
//  Created by katia kutsi on 5/13/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

protocol filterProtocol{
    func filterFunc(array: [PodcastStruct])
}

class FilterViewController: UIViewController {

    @IBOutlet weak var maxDuration: UITextField!
    
    var filteredArray = [PodcastStruct]()
    
    var filterProtocolDelegate: filterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func filterDuration(_ sender: Any) {
        filter()
        filterProtocolDelegate?.filterFunc(array: filteredArray)
        self.dismiss(animated: true, completion: nil)
    }
    
    func filter() {
        let maxDurationFor = maxDuration.text ?? ""
        let arr = maxDurationFor.split(separator: ":")
        var arr2 = [Int]()
        for i in arr{
            var k = Int(i)
            arr2.append(k!)
        }
        let dur = arr2[0]*60 + arr2[1]
       
        
        let context = AppDelegate.coreDataContainer.viewContext
        let request: NSFetchRequest<Podcast> = Podcast.fetchRequest()
        request.predicate = NSPredicate(format: "duration < \(dur)")
        
        do{
            let result = try context.fetch(request)
            guard let podcasts = result as? [Podcast] else {return}
            for item in podcasts{
                if let p = item as? Podcast{
                    if let tit = p.title{
                        if let desc = p.poddescription{
                            
                            filteredArray.append(PodcastStruct(title: tit, description: desc, duration: Int(p.duration)))
                            
                        }
                    }
                }
            }
        }catch{}
    }
    
}
