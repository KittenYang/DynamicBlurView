//
//  ViewController.swift
//  DynamicBlurViewDemo
//
//  Created by KittenYang on 15/12/6.
//  Copyright © 2015年 KittenYang. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private var blurView: DynamicBlurView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    //TEST:
    let scrollView = UIScrollView.init(frame: self.view.bounds)
    scrollView.delegate = self
    for i in 0..<10 {
      let img = UIImageView.init(image: UIImage(named: "Screenshot.PNG"))
      img.frame = CGRectMake(0, img.frame.size.height*CGFloat(i),self.view.bounds.width, img.frame.size.height);
      img.contentMode = .ScaleAspectFill
      scrollView.addSubview(img)
    }
    scrollView.contentSize = CGSizeMake(0, 568*10)
    self.view.addSubview(scrollView)

    // BlurView
    blurView = DynamicBlurView(frame: CGRect(x: 0, y: 200, width: 300, height: 48), backView: scrollView)
    //蓝色：UIColor(red: 114/255.0, green: 194/255.0, blue: 239/255.0, alpha: 1.0)
    //红色：UIColor(red: 215/255.0, green: 73/255.0, blue: 59/255.0, alpha: 1.0)
    blurView.center = self.view.center
    self.view.addSubview(blurView)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

// MARK: - You must call blurView.dynamicBlur()

extension ViewController : UIScrollViewDelegate
{
  func scrollViewDidScroll(scrollView: UIScrollView) {
    blurView.dynamicBlur()
  }
}

