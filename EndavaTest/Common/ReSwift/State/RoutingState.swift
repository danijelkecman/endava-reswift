//
//  RoutingState.swift
//  EndavaTestReSwit
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import ReSwift

struct RoutingState: StateType {
  var navigationState: RoutingDestinations
  var navigationBoard: AppStoryboard
  
  init(navigationState: RoutingDestinations = .newsSources, navigationBoard: AppStoryboard = .Main) {
    self.navigationState = navigationState
    self.navigationBoard = navigationBoard
  }
}
