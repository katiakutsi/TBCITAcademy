//
//  NotesViewController.swift
//  task_21
//
//  Created by katia kutsi on 5/14/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class NotesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var notes = [String]()
    var signedUser: UserStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        fetchNotes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchNotes()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let id = segue.identifier, id == "segue_for_add_note"{
            if let AddNotesVC = segue.destination as? AddNotesViewController{
                AddNotesVC.signedUser = signedUser
            }
        }
    }

    
    func fetchNotes(){
        notes.removeAll()
        let context = AppDelegate.coreDataContainer.viewContext
        let request: NSFetchRequest<Note> = Note.fetchRequest()

        
        do {
            let result = try context.fetch(request)
                   
            guard let notes = result as? [Note] else {return}
                   
            for item in notes{
                if let p = item as? Note{
                    if let cont = p.content{
                        self.notes.append(cont)
                    }
                }
            }
        } catch {}
    }

}
extension NotesViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
         let delete = UIContextualAction(style: .destructive, title: "Delete") { (action,view, handler) in
             self.notes.remove(at: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: .left)
             handler(true)
         }
         
         let edit = UIContextualAction(style: .normal, title: "Edit"){ (actiib, view, handler) in
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let EditNoteVC = storyboard.instantiateViewController(withIdentifier: "add_note_page")
             if let unwrappedVC = EditNoteVC as? AddNotesViewController{
                unwrappedVC.shouldEditContent = self.notes[indexPath.row]
             }
             self.navigationController?.pushViewController(EditNoteVC, animated: true)
         }
         edit.backgroundColor = .systemIndigo
         
         let config = UISwipeActionsConfiguration(actions: [delete, edit])
         
         return config

     }
}
extension NotesViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notes_cell", for: indexPath) as! NotesCell
        cell.noteLabel.text = notes[indexPath.row]
        return cell
    }
    
    
}
