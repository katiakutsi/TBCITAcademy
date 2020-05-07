//
//  MessagesViewController.swift
//  task_17
//
//  Created by katia kutsi on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {

    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var longTextMessage: UITextView!
    
    var chatContact = ChatContact()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactName.text = chatContact.contactName
        longTextMessage.text = chatContact.contactMessage
    }
    
}
