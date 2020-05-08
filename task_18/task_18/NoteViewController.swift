//
//  NoteViewController.swift
//  task_18
//
//  Created by katia kutsi on 5/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var fullNote: UITextView!
    
    var noteForFull : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNote.text = noteForFull
    }
    
}
