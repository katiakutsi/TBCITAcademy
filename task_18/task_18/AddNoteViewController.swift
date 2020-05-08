//
//  AddNoteViewController.swift
//  task_18
//
//  Created by katia kutsi on 5/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

protocol forNewNote{
    func noteToNotes(note: String)
}

class AddNoteViewController: UIViewController {
    
    var delegate : forNewNote?

    @IBOutlet weak var addNoteTextView: UITextView!
    
    @IBOutlet weak var addNoteName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNoteButton(_ sender: UIButton) {
        let newNote = addNoteTextView.text ?? ""
        let noteName = addNoteName.text ?? ""
        let fm = FileManager.default
        let mainUrl = try! fm.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        do {
            try newNote.write(to: mainUrl.appendingPathComponent("\(noteName).txt"), atomically: true, encoding: .utf8)
        } catch  {
            
        }
        self.delegate?.noteToNotes(note: newNote)
        addNoteTextView.text = ""
        addNoteName.text = ""
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
