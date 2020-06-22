//
//  AddPostViewController.swift
//  task_22
//
//  Created by katia kutsi on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController {
    @IBOutlet weak var postContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addPost(_ sender: Any) {
        publishPost()
        postContent.text = ""
    }
    
    private func publishPost() {
        let context = AppDelegate.coreDataContainer.viewContext
        let post = Post(context: context)
        post.content = postContent.text
        post.date = Date()
        do {
            try context.save()
            print("Saved")
        } catch {}
    }
}

