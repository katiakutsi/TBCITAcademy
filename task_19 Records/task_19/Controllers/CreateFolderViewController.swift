//
//  CreateFolderViewController.swift
//  task_19
//
//  Created by katia kutsi on 5/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

protocol CreateFolderProtocol{
    func newFolderFunc()
}

class CreateFolderViewController: UIViewController {

    @IBOutlet weak var FolderNameField: UITextField!
    
    var createFolderProtocolDelegate : CreateFolderProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createButton(_ sender: UIButton) {
        let folderName = FolderNameField.text ?? ""
        let fm = FileManager.default
        let docsUrl = try! fm.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        let folderUrl = docsUrl.appendingPathComponent(folderName)
        try! fm.createDirectory(at: folderUrl, withIntermediateDirectories: true, attributes: nil)
        //print(folderUrl)
        //print(folderUrl.lastPathComponent)
        FolderNameField.text = ""
        createFolderProtocolDelegate?.newFolderFunc()
    }
}
