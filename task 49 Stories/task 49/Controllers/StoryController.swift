//
//  StoryController.swift
//  task 49
//
//  Created by katia kutsi on 7/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class StoryController: UIViewController {
    
    @IBOutlet weak var imv: UIImageView!
    var selectedCellIndex = -1
    
    var images = [ UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(selectedCellIndex)
        imv.image = images[selectedCellIndex]
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                previousStory()
            case .down:
                exitStory()
            case .left:
                nextStory()
            default:
                break
            }
        }
    }
    
    private func nextStory() {
        if selectedCellIndex != images.count - 1 {
            selectedCellIndex += 1
            let transition = CATransition()
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            imv.layer.add(transition, forKey: nil)
            self.imv.image = self.images[self.selectedCellIndex]
        }
    }
    
    private func previousStory() {
        if selectedCellIndex != 0 {
            selectedCellIndex -= 1
            let transition = CATransition()
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            imv.layer.add(transition, forKey: nil)
            self.imv.image = self.images[self.selectedCellIndex]
        }
    }
    
    private func exitStory() {
        dismiss(animated: true)
    }
}
