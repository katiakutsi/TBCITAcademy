//
//  ImageViewController.swift
//  task 47
//
//  Created by katia kutsi on 6/24/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imv: UIImageView!
    
    var backImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imv.image = backImage
        configurePanGesture()
    }
    
    
    private func configurePanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func didPan(_ gesture: UIPanGestureRecognizer) {

        switch  gesture.state {
        case .began:
            break
        case .changed:
            gesture.view!.transform = CGAffineTransform(translationX: 0, y: 0)

        case .ended:
            UIView.animate(withDuration: 1,delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: [],animations: {
                self.dismiss(animated: true)
            })
        default:
            print("")
        }
    }

}
