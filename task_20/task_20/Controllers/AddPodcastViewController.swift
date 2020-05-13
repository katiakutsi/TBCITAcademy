//
//  AddPodcastViewController.swift
//  task_20
//
//  Created by katia kutsi on 5/13/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

protocol resetProtocol{
    func reset()
}

class AddPodcastViewController: UIViewController {
    @IBOutlet weak var inputPodcastTitle: UITextField!
    @IBOutlet weak var inputPodcastDescription: UITextView!
    @IBOutlet weak var inputDuration: UIPickerView!
    
    var resetProtocolDelegate: resetProtocol?
    
    var numbers = [String]()
    
    var selectedRow1 = 0
    var selectedRow2 = 0
    
    var podcastDuration: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputDuration.dataSource = self
        inputDuration.delegate = self
        
        for i in 0...60{
            numbers.append(String(i))
        }
        
    }
    
    @IBAction func savePodcastButton(_ sender: UIButton) {
        save()
        resetProtocolDelegate?.reset()
        inputPodcastTitle.text = ""
        inputPodcastDescription.text = ""
    }
    
    func save() {
        let context = AppDelegate.coreDataContainer.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: "Podcast", in: context)
        let podcast = Podcast(entity: entityDescription!, insertInto: context)
        podcast.title = inputPodcastTitle.text
        podcast.poddescription = inputPodcastDescription.text
        podcastDuration = selectedRow1*60 + selectedRow2
        podcast.duration = Int16(podcastDuration!)
        do{
            try context.save()
        } catch {}
    }
}



extension AddPodcastViewController : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 80
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            selectedRow1 = row
        } else if component == 1{
            selectedRow2 = row
        }
    }
    
}

extension AddPodcastViewController : UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numbers[row]
    }
}

