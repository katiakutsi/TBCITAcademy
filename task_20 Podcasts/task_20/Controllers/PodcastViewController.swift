//
//  PodcastViewController.swift
//  task_20
//
//  Created by katia kutsi on 5/13/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class PodcastViewController: UIViewController {
    @IBOutlet weak var podcastTitle: UILabel!
    @IBOutlet weak var podcastDesctiption: UITextView!
    @IBOutlet weak var podcastDuration: UILabel!
    
    var podcastTitleFor: String?
    var podcastDescriptionFor: String?
    var podcastDurationFor: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        podcastTitle.text = podcastTitleFor
        podcastDesctiption.text = podcastDescriptionFor
        podcastDuration.text = String(podcastDurationFor!)
    }
    
}
