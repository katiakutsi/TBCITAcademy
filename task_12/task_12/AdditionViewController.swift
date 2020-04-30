//
//  AdditionViewController.swift
//  task_12
//
//  Created by katia kutsi on 4/30/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

protocol NewsPageDelegate {
    func infoToPreviousPage(array : [News])
}

class AdditionViewController: UIViewController {

    var delegate: NewsPageDelegate?

    
    @IBOutlet weak var titleToAdd: UITextField!
    
    @IBOutlet weak var contentTextView: UITextView!
    
    var news = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func onAdd(_ sender: UIButton) {
        let title = titleToAdd.text ?? ""
        let content = contentTextView.text ?? ""
        
        let newInformation = News(title: title, content : content)
        news.append(newInformation)
        
        delegate?.infoToPreviousPage(array : news)
        
        clearTextFields()
    }
        
    private func clearTextFields(){
        titleToAdd.text = ""
        contentTextView.text = ""
    }

}

struct News{
    var title : String?
    var content : String?
}
