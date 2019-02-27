
Product Image ZOOM (Image Pinch Zoom Slider)
-inspired from KIImagePager

IMAGES

![alt text](https://github.com/skygaikwad/ImageZoomerSlider/blob/master/One.png?raw=true "Image Zoom Silder")
![alt text](https://github.com/skygaikwad/ImageZoomerSlider/blob/master/Two.png?raw=true)



HOW TO USE:-

Swift

      let storyboard = UIStoryboard(name: "ProductImageZoomStoryboard", bundle: nil)
      if let zoomVC = storyboard.instantiateViewController(withIdentifier: "ProductImageZoomViewController") as? ProductImageZoomViewController {
      zoomVC.modalTransitionStyle = .crossDissolve
      //            zoomVC.arrayOfSlider = ["DemoImage1","DemoImage2","DemoImage3"] // assign values here currently default value is set
      zoomVC.isZoomEnable = true // for Image Zooming
      DispatchQueue.main.async {
      self.navigationController?.pushViewController(zoomVC, animated: true)
      }
      }


OBJC

      UIStoryboard *mainIntroTutorial = [UIStoryboard storyboardWithName:@"ProductImageZoomStoryboard"
      bundle: nil];
      ProductImageZoomViewController *zoomVC = [mainIntroTutorial instantiateViewControllerWithIdentifier:@"ProductImageZoomViewController"];
      zoomVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
      zoomVC.arrayOfSlider = self.modelProduct.imageModel.arrayImageMain;
      zoomVC.isZoomEnable = true;
      [self presentViewController:zoomVC animated:true completion:nil];

