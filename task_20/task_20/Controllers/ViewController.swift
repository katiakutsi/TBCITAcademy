//
//  ViewController.swift
//  task_20
//
//  Created by katia kutsi on 5/13/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, resetProtocol, filterProtocol {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var podcastsArray = [PodcastStruct]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetch()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "segue_for_add_record"{
            if let AddPodcastVC = segue.destination as? AddPodcastViewController{
                AddPodcastVC.resetProtocolDelegate = self
            }
        }
        if let id = segue.identifier, id == "segue_for_filtr"{
            if let FilterVC = segue.destination as? FilterViewController{
                FilterVC.filterProtocolDelegate = self
            }
        }
    }
    
    func reset() {
        fetch()
        tableView.reloadData()
    }
    
    func filterFunc(array: [PodcastStruct]) {
        podcastsArray.removeAll()
        podcastsArray.append(contentsOf: array)
        tableView.reloadData()
    }
}

extension ViewController{
    func fetch(){
        podcastsArray.removeAll()
        let context = AppDelegate.coreDataContainer.viewContext
        let request: NSFetchRequest<Podcast> = Podcast.fetchRequest()

        
        do {
            let result = try context.fetch(request)
                   
            guard let podcasts = result as? [Podcast] else {return}
                   
            for item in podcasts{
                if let p = item as? Podcast{
                    if let tit = p.title{
                        if let desc = p.poddescription{
                            podcastsArray.append(PodcastStruct(title: tit, description: desc, duration: Int(p.duration)))
                        }
                    }
                }
            }
        } catch {}
    }
}

extension ViewController : UITableViewDelegate{
    
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcastsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "podcast_cell", for: indexPath) as! PodcastCell
        cell.podcastTitle.text = podcastsArray[indexPath.row].title
        cell.podcastShortDescription.text = podcastsArray[indexPath.row].description
        cell.podcastDuration.text = String(podcastsArray[indexPath.row].duration!/60) + ":" + String(podcastsArray[indexPath.row].duration!%60)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let PodcastVC = storyboard.instantiateViewController(withIdentifier: "podcast_page")
        if let unwrappedVC = PodcastVC as? PodcastViewController{
            unwrappedVC.podcastTitleFor = podcastsArray[indexPath.row].title
            unwrappedVC.podcastDescriptionFor = podcastsArray[indexPath.row].description
            unwrappedVC.podcastDurationFor = podcastsArray[indexPath.row].duration
        }
        self.navigationController?.pushViewController(PodcastVC, animated: true)
    }
    
}

struct PodcastStruct {
    var title : String?
    var description : String?
    var duration : Int?
}
