//
//  AddRecordsViewController.swift
//  task_19
//
//  Created by katia kutsi on 5/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

protocol RecordsToPreviousPage{
    func recordToPreviusPage()
    
}

class AddRecordsViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var recrodsToPreviusPageDelegate : RecordsToPreviousPage?
    
    var shouldEditRecord : String?
    
    var folderName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = shouldEditRecord

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addRecordButton(_ sender: UIButton) {
        let folderNameForFile = folderName ?? ""
        let text = textView.text ?? ""
        let fm = FileManager.default
        let docsUrl = try! fm.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        
        let folderPath = docsUrl.appendingPathComponent(folderNameForFile)
        
        let fileName = "note_\(Int.random(in: 0...100)).txt"
        
        let noteFileUrl = folderPath.appendingPathComponent(fileName)
        
        try! text.write(to: noteFileUrl, atomically: true, encoding: .utf8)
        
        // clear field
        textView.text = ""
        recrodsToPreviusPageDelegate?.recordToPreviusPage()
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
