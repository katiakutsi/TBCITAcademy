//
//  MainVC.swift
//  task16
//
//  Created by katia kutsi on 5/6/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var letter: UITextView!
    @IBOutlet weak var segmentIndex: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        letter.text! = UDManager.getLetter()
        segmentIndex.selectedSegmentIndex = UDManager.getSegmentIndex()
        colors(segmentIndex)
    }
    
    @IBAction func colors(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0 : letter.backgroundColor = .systemGray
        case 1 : letter.backgroundColor = .systemYellow
        case 2: letter.backgroundColor = .systemGreen
        case 3: letter.backgroundColor = .systemBlue
        case 4: letter.backgroundColor = .systemIndigo
        default: print("")
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        UDManager.saveLetter(value: letter.text)
        UDManager.saveSegmentIndex(value: segmentIndex.selectedSegmentIndex)
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        UDManager.untappedOnLogOut()
        self.navigationController?.popViewController(animated: true)
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
