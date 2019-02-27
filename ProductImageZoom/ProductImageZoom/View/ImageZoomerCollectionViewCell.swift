//
//  ImageZoomerCollectionViewCell.swift
//  CoutLoot
//
//  Created by apple on 2/15/19.
//  Copyright © 2019 CoutLoot. All rights reserved.
//

import UIKit

class ImageZoomerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var scrollViewZoomer: UIScrollView! {
        didSet {
            scrollViewZoomer.minimumZoomScale = 1.0
            scrollViewZoomer.maximumZoomScale = 10.0
            scrollViewZoomer.alwaysBounceVertical = false
            scrollViewZoomer.alwaysBounceHorizontal = false
            scrollViewZoomer.showsVerticalScrollIndicator = true
            scrollViewZoomer.zoomScale = 1.0

        }
    }
    @IBOutlet weak var imgZoomer: UIImageView!
    
    func configZoomerCell(withUrl:String, orName withImageName:String, swithUrlToImage: Bool, zoomOption: Bool) {
        if swithUrlToImage == true {
            imgZoomer.image = UIImage(named: withImageName)
        }else {
            
        }
        if zoomOption == true {
            scrollViewZoomer.delegate = self
        }
    }
    
    func resetOptions() {
//        imgZoomer.transform = CGAffineTransform.identity
//        scrollViewZoomer.transform = CGAffineTransform.identity
        scrollViewZoomer.zoomScale = 1.0
//        scrollViewZoomer.contentSize = imgZoomer.frame.size
//        self.viewForZooming(in: scrollViewZoomer)
    }
    
}

extension ImageZoomerCollectionViewCell: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgZoomer
    }
}
