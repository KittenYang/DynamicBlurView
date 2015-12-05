//
//  DynamicBlurView.swift
//  DynamicBlurViewDemo
//
//  Created by KittenYang on 15/12/6.
//  Copyright © 2015年 KittenYang. All rights reserved.
//

import UIKit

class DynamicBlurView: UIImageView {
  
  private var _backView: UIView?
  
  init(frame: CGRect, backView: UIView, color:UIColor = UIColor.clearColor()) {
    super.init(frame: frame)
    _backView = backView
    
    if color !=  UIColor.clearColor(){
      setUpColorView(color)
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func didMoveToSuperview() {
    dynamicBlur()
  }
  
  /**
   You must call this method to simulate the dynamic blur effect.
   */
  func dynamicBlur() {
    if let backSuperView = _backView?.superview {
      self.image = nil
      self.image = self.blurView(backSuperView)
    }
  }
  
  // private funcs
  
  private func setUpColorView(overColor: UIColor) {
    let colorView = UIView(frame: self.bounds)
    colorView.backgroundColor = overColor
    colorView.alpha = 0.5
    addSubview(colorView)
  }
  
  private func blurView(inputView: UIView) -> UIImage {
    let blurImage = getTargetArea(self.convertRect(bounds, toView: inputView), fromView: inputView)
    return blurImage.stackBlur(20)
  }
  
  private func getTargetArea(area: CGRect,fromView: UIView) -> UIImage {
    if UIScreen.mainScreen().respondsToSelector("scale"){
      UIGraphicsBeginImageContextWithOptions(area.size, true, UIScreen.mainScreen().scale)
    }else{
      UIGraphicsBeginImageContext(area.size);
    }
    
    let ctx = UIGraphicsGetCurrentContext()
    CGContextTranslateCTM(ctx, -area.origin.x, -area.origin.y)
    fromView.layer.renderInContext(ctx!)
    
    let snapshotImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext();
    
    return snapshotImage;
  }
  
}
