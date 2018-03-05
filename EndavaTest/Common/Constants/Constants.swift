//
//  Constants.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

enum AppStoryboard: String {
  case Main
  
  var instance: UIStoryboard {
    return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
  }
  
  func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
    let storyboardId = (viewControllerClass as UIViewController.Type).storyboardId
    return instance.instantiateViewController(withIdentifier: storyboardId) as! T
  }
  
  func initialViewController() -> UIViewController? {
    return instance.instantiateInitialViewController()
  }
}
