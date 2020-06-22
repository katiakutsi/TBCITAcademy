//
//  AddNotesViewController.swift
//  task_21
//
//  Created by katia kutsi on 5/14/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class AddNotesViewController: UIViewController {
    @IBOutlet weak var content: UITextView!
    var signedUser: UserStruct?
    var shouldEditContent: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(signedUser)
        content.text = shouldEditContent
    }
    
    @IBAction func addNoteButton(_ sender: UIButton) {
        saveNote()
        content.text = ""
        self.navigationController?.popViewController(animated: true)
    }
    func saveNote(){
        let context = AppDelegate.coreDataContainer.viewContext
        let note = Note(context: context)
        let user = User(context: context)
        note.content = content.text
        //let noteContent = note.content
        user.username = signedUser?.username
        user.password = signedUser?.password
        //let user = signedUser
        //user.notesArray.append(noteContent!)
        //
        do{
            try context.save()
        }catch {}
    }
}
