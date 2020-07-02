//
//  ViewController.swift
//  task 49
//
//  Created by katia kutsi on 6/28/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyCustomCellDelegator{
    
    let transition = PopAnimator()
    
    var selectedCellIndex = 0
    
    var selectedCell: OthersStoryCell?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        transition.dismissCompletion = { [weak self] in
            guard let selectedCell = self?.selectedCell
            else {
              return
          }

          selectedCell.isHidden = false
        }
        
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "segue" {
            if let storyVC = segue.destination as? StoryController {
                storyVC.transitioningDelegate = self
                storyVC.selectedCellIndex = selectedCellIndex
            }
        }
    }
    func callSegueFromCell(cell: OthersStoryCell) {
        self.selectedCell = cell
        self.performSegue(withIdentifier: "segue", sender: nil )
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 645
        }
        
        return 148
    }
}
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
            cell.delegate = self
            cell.didSelectItemAction = { [weak self] indexPath, storyCell in
                self?.selectedCellIndex = indexPath.row
                self?.selectedCell = storyCell
            }
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NormalCell.identifier, for: indexPath) as! NormalCell
        return cell
        
    }
}


extension ViewController: UIViewControllerTransitioningDelegate {

    func animationController(
      forPresented presented: UIViewController,
      presenting: UIViewController, source: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            
            guard let selectedCell = selectedCell,
              let selectedCellSuperview = selectedCell.superview
              else {
                return nil
            }

            transition.originFrame = selectedCellSuperview.convert(selectedCell.frame, to: nil)
            transition.originFrame = CGRect(
              x: transition.originFrame.origin.x + 20,
              y: transition.originFrame.origin.y + 20,
              width: transition.originFrame.size.width - 40,
              height: transition.originFrame.size.height - 40
            )

            transition.presenting = true
            selectedCell.isHidden = true

      return transition
    }

    func animationController(forDismissed dismissed: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            transition.presenting = false
            return transition


    }

}
