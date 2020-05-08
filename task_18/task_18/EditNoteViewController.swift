//
//  EditNoteViewController.swift
//  task_18
//
//  Created by katia kutsi on 5/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

protocol forEditNote{
    func editedNote(note : String)
}

class EditNoteViewController: UIViewController {
    
    var delegate2 : forEditNote?

    @IBOutlet weak var editNoteTextView: UITextView!
    
    var shouldEditNote : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editNoteTextView.text = shouldEditNote
    }
    
    @IBAction func editButton(_ sender: UIButton) {
        let editedNote = editNoteTextView.text ?? ""
        self.delegate2?.editedNote(note: editedNote)
        self.navigationController?.popViewController(animated: true)
    }
    
    func readText(url: URL) -> String {
        return try! String(contentsOf: url)
    }

}
