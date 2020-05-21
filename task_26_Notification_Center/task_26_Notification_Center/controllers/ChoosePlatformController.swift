//
//  ChoosePlatformController.swift
//  task_26_Notification_Center
//
//  Created by katia kutsi on 5/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import Kingfisher

class ChoosePlatformController: UIViewController {
    
    @IBOutlet weak var androidImage: UIImageView!
    @IBOutlet weak var appleImage: UIImageView!
    
    let androidUrl = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/3e/Android_logo_2019.png")
    let appleUrl = URL(string: "https://i.pinimg.com/564x/1c/aa/03/1caa032c47f63d50902b9d34492e1303.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        androidImage.kf.setImage(with: androidUrl)
        appleImage.kf.setImage(with: appleUrl)
        
        let tapOnAndroidImage = UITapGestureRecognizer(target: self, action: #selector(onAndroidImage))
        let tapOnAppleImage = UITapGestureRecognizer(target: self, action: #selector(onAppleImage))
        
        androidImage.addGestureRecognizer(tapOnAndroidImage)
        appleImage.addGestureRecognizer(tapOnAppleImage)
        
        androidImage.isUserInteractionEnabled = true
        appleImage.isUserInteractionEnabled = true
        view.isUserInteractionEnabled = true
        
    }
    
    @objc func onAndroidImage(_ sender: UIGestureRecognizer){
        let android = ["image": "https://upload.wikimedia.org/wikipedia/commons/3/3e/Android_logo_2019.png",
                       "text" : "nobody is perfect"]
        NotificationCenter.default.post(name: .choosenPlatformID, object: nil, userInfo: android)
        self.dismiss(animated: true)
    }
    @objc func onAppleImage(_ sender: UIGestureRecognizer){
        let apple = ["image": "https://i.pinimg.com/564x/1c/aa/03/1caa032c47f63d50902b9d34492e1303.jpg",
                    "text" : "better choice :)"]
        NotificationCenter.default.post(name: .choosenPlatformID, object: nil, userInfo: apple)
        self.dismiss(animated: true)
    }
}
