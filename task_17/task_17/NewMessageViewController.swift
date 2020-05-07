//
//  NewMessageViewController.swift
//  task_17
//
//  Created by katia kutsi on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

protocol forNewMessage {
    func messageToChat(contact : ChatContact)
}

class NewMessageViewController: UIViewController {
    
    var delegate: forNewMessage?

    @IBOutlet weak var newContactName: UITextField!
    @IBOutlet weak var newMessage: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
    @IBAction func sendButton(_ sender: UIButton) {
        let contactName = newContactName.text
        let message = newMessage.text
        let chatContact = ChatContact(contactName: contactName, contactMessage: message)
        self.delegate?.messageToChat(contact: chatContact)
        clearTextFields()
    }
    
    func clearTextFields(){
        newContactName.text = ""
        newMessage.text = ""
    }
    
}
