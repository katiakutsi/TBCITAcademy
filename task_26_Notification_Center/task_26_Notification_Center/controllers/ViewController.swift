//
//  ViewController.swift
//  task_26_Notification_Center
//
//  Created by katia kutsi on 5/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var imv: UIImageView!
    @IBOutlet weak var roundedButton: UIButton!
    @IBOutlet weak var textAboutPlatform: UILabel!
    
    var url = URL(string: "https://i.pinimg.com/originals/15/e6/0f/15e60fac3b9468e58653e6ba581f8ab0.jpg")
    var choosenImageUrl: String?
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedButton.layer.cornerRadius = 30
        
        imv.kf.setImage(with: url)
    
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didRecieveInfo(with:)),
            name: .choosenPlatformID,
            object: nil)

    }
    
    
    @objc func didRecieveInfo(with notification : Notification){
        if let userInfo = notification.userInfo{
            choosenImageUrl = userInfo["image"] as? String
            imv.kf.setImage(with: URL(string: choosenImageUrl ?? ""))
            text = userInfo["text"] as? String
            textAboutPlatform.text = text
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension NSNotification.Name{
    static let choosenPlatformID = NSNotification.Name("choosen_platform_id")
}
