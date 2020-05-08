//
//  ViewController.swift
//  task_18
//
//  Created by katia kutsi on 5/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, forNewNote, forEditNote {

    @IBOutlet weak var tableView: UITableView!
    
    var arr = [String]()
    
    var indexNeeded = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    @IBAction func addNoteBarButton(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let AddNoteVC = storyboard.instantiateViewController(withIdentifier: "add_note_page")
        if let unwrappedVC = AddNoteVC as? AddNoteViewController{
            unwrappedVC.delegate = self
        }
        self.navigationController?.pushViewController(AddNoteVC, animated: true)
    }
    
    func noteToNotes(note: String) {
        arr.append(note)
        tableView.reloadData()
    }
    
    func editedNote(note: String) {
        arr[indexNeeded] = note
        tableView.reloadData()
    }

}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notes_cell") as! NotesCell
        
        cell.shortNote.text = arr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let FullNoteVC = storyboard.instantiateViewController(withIdentifier: "note_page")
        if let unwrappedVC = FullNoteVC as? NoteViewController{
            unwrappedVC.noteForFull = arr[indexPath.row]
        }
        self.navigationController?.pushViewController(FullNoteVC, animated: true)
    }
    
    
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action,view, handler) in
            self.arr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            handler(true)
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit"){ (actiib, view, handler) in
            self.indexNeeded = indexPath.row
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let EditNoteVC = storyboard.instantiateViewController(withIdentifier: "edit_note_page")
            if let unwrappedVC = EditNoteVC as? EditNoteViewController{
                unwrappedVC.shouldEditNote = self.arr[indexPath.row]
                unwrappedVC.delegate2 = self
            }
            self.navigationController?.pushViewController(EditNoteVC, animated: true)
        }
        edit.backgroundColor = .systemIndigo
        
        let config = UISwipeActionsConfiguration(actions: [delete, edit])
        
        return config

    }
}


