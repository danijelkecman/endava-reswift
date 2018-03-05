//
//  AppRouter.swift
//  EndavaTestReSwit
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import ReSwift

enum RoutingDestinations: String {
  case newsSources = "NewsSourcesViewController"
  case feedList = "NewsFeedListViewController"
  case newsDetails = "NewsDetailsViewController"
}

final class AppRouter {
  let navigationController: UINavigationController
  
  init(window: UIWindow) {
    navigationController = UINavigationController()
    window.rootViewController = navigationController
    
    store.subscribe(self) {
      $0.select {
        $0.routingState
      }
    }
  }
}

extension AppRouter: StoreSubscriber {
  func newState(state: RoutingState) {
    let shouldAnimate = navigationController.topViewController != nil
    pushviewControllerWith(identifier: state.navigationState.rawValue, from: state.navigationBoard.rawValue, animated: shouldAnimate)
  }
}

// Private navigation methods

fileprivate extension AppRouter {
  
  func pushviewControllerWith(identifier: String, from storyboard: String, animated: Bool) {
    let viewController = instantiateViewControllerWith(identifier: identifier, from: storyboard)
    
    if controllerIsAlreadyOnStack(viewController: viewController) { return }
    
    navigationController.pushViewController(viewController, animated: animated)
  }
  
  func instantiateViewControllerWith(identifier: String, from storyboard: String) -> UIViewController {
    let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
    return storyboard.instantiateViewController(withIdentifier: identifier)
  }
  
  func controllerIsAlreadyOnStack(viewController: UIViewController) -> Bool {
    let viewControllerType = type(of: viewController)
    if let currentViewController = navigationController.topViewController {
      let currentViewControllerType = type(of: currentViewController)
      if viewControllerType == currentViewControllerType {
        return true
      }
    }
    return false
  }

}



































