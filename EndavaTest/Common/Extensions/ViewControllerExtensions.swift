//
//  ViewControllerExtensions.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

extension UIViewController {
  
  var className: String {
    return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
  }
  
  class var storyboardId: String {
    return "\(self)"
  }
  
  static func instantiateFrom(appStoryboard: AppStoryboard) -> Self {
    return appStoryboard.viewController(viewControllerClass: self)
  }
  
}
