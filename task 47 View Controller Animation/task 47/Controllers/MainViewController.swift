//
//  ViewController.swift
//  task 47
//
//  Created by katia kutsi on 6/24/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let transition = PopAnimator()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let images = [UIImage(named: "artwalk"), UIImage(named: "untitled"), UIImage(named: "cow"), UIImage(named: "rolling_stones")]
    
    var choosenImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.backgroundColor = .clear
        view.isUserInteractionEnabled = true

        transition.dismissCompletion = { [weak self] in
          guard
            let selectedIndexPathCell = self?.collectionView.indexPathsForSelectedItems,
            let selectedCell = self?.collectionView.cellForItem(at: selectedIndexPathCell[0])
              as? CollectionViewCell
            else {
              return
          }

          selectedCell.isHidden = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "segue"{
            if let ImageVC = segue.destination as? ImageViewController{
                ImageVC.backImage = choosenImage
                ImageVC.transitioningDelegate = self
                ImageVC.modalPresentationStyle = .fullScreen

            }
        }
    }

}

extension MainViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3 + 20, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

extension MainViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imv.image = images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        choosenImage = images[indexPath.row]!
        performSegue(withIdentifier: "segue", sender: nil)
    }
    
}

extension MainViewController: UIViewControllerTransitioningDelegate {

    func animationController(
      forPresented presented: UIViewController,
      presenting: UIViewController, source: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            
            guard
                let selectedIndexPathCell = collectionView.indexPathsForSelectedItems,
                let selectedCell = collectionView.cellForItem(at: selectedIndexPathCell[0])
                as? CollectionViewCell,
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

