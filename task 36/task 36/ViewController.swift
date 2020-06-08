//
//  ViewController.swift
//  task 36
//
//  Created by katia kutsi on 6/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var pageIndex = 0
    
    var pages = [Page]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupPages()
    }

    private func setupPages() {
        let page1 = Page(imageNamed: "first_image", title: "Online shopping", text: "Women Fashion Shopping Online - Shop from a huge range of latest women clothing, shoes, makeup Kits, Watches, footwear and more for women at best price")
        
        let page2 = Page(imageNamed: "second_image", title: "Add to cart", text: "Add to cart button works on product pages. The customizations in this section  compatible with dynamic checkout buttons")
        
        let page3 = Page(imageNamed: "third_image", title: "Payment Successful", text: "Your payment has been successfully completed. You will receive a confirmation email within a few minutes. ")
        
        self.pages.append(page1)
        self.pages.append(page2)
        self.pages.append(page3)
        
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        if pageControl.currentPage + 1 < pages.count{
            let index = IndexPath(item: pageControl.currentPage + 1, section: 0)
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = pageControl.currentPage + 1
            
        }

    }
    
}

extension ViewController : UICollectionViewDelegate {}
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageCell
        
        let page = pages[indexPath.row]
        cell.bind(page: page)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let offset = targetContentOffset.pointee
        let x = offset.x
        //print(x)
        pageIndex = Int(x / collectionView.frame.width)
//        print(collectionView.frame.width)
//        print(pageIndex)
//        print(pageIndex + 1)

        if x > collectionView.frame.width{
            pageControl.currentPage = Int(pageIndex + 1)
            pageIndex += 1
        } else{
            pageControl.currentPage = Int(pageIndex)

        }
       }
}

struct Page {
    let imageNamed: String
    let title: String
    let text: String
    
    var image: UIImage? {
        return UIImage(named: imageNamed)
    }
}
