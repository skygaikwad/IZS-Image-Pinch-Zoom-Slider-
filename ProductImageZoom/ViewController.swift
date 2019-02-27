//
//  ViewController.swift
//  ProductImageZoom
//
//  Created by apple on 2/15/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func OpenProductZommer(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ProductImageZoomStoryboard", bundle: nil)
        if let zoomVC = storyboard.instantiateViewController(withIdentifier: "ProductImageZoomViewController") as? ProductImageZoomViewController {
            zoomVC.modalTransitionStyle = .crossDissolve
//            zoomVC.arrayOfSlider = ["DemoImage1","DemoImage2","DemoImage3"] // assign values here currently default value is set
            zoomVC.isZoomEnable = true // for Image Zooming
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(zoomVC, animated: true)
            }
        }

    }
    // Objective C version
    /*
     UIStoryboard *mainIntroTutorial = [UIStoryboard storyboardWithName:@"ProductImageZoomStoryboard"
     bundle: nil];
     ProductImageZoomViewController *zoomVC = [mainIntroTutorial instantiateViewControllerWithIdentifier:@"ProductImageZoomViewController"];
     zoomVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
     zoomVC.arrayOfSlider = self.modelProduct.imageModel.arrayImageMain;
     zoomVC.isZoomEnable = true;
     [self presentViewController:zoomVC animated:true completion:nil];

 */

}

