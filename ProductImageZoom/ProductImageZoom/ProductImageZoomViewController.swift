//
//  ProductImageZoomViewController.swift
//  CoutLoot
//
//  Created by apple on 2/15/19.
//  Copyright © 2019 CoutLoot. All rights reserved.
//

import UIKit

class ProductImageZoomViewController: UIViewController {
    @IBOutlet weak var collectionViewPager: UICollectionView!
    let arrayOfSlider = ["DemoImage1","DemoImage2","DemoImage3"]
    var isZoomEnable = true
    var isLocalImages = true
    
    @IBOutlet weak var lblCounts: UILabel! {
        didSet {
            lblCounts.text = "1/\(arrayOfSlider.count)"
            lblCounts.layer.cornerRadius = 10
            lblCounts.layer.backgroundColor = UIColor.groupTableViewBackground.cgColor
        }
    }
    
    
    @IBOutlet weak var pageControl: UIPageControl! {
        didSet {
            pageControl.currentPage = 0
            pageControl.numberOfPages = arrayOfSlider.count
            pageControl.currentPageIndicatorTintColor = UIColor.black
            pageControl.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewPager.isPagingEnabled = true
        collectionViewPager?.backgroundColor = .white

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCloseAction(_ sender: Any) {
        
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
        lblCounts.text = "\(pageControl.currentPage+1)/\(arrayOfSlider.count)"


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
extension ProductImageZoomViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfSlider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageZoomerCollectionViewCell", for: indexPath) as! ImageZoomerCollectionViewCell
        if let imgLocator = arrayOfSlider[indexPath.item] as? String {
            cell.configZoomerCell(withUrl: imgLocator, orName: imgLocator, swithUrlToImage: isLocalImages, zoomOption: isZoomEnable)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cellReset = cell as! ImageZoomerCollectionViewCell
        cellReset.resetOptions()        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}
