//
//  AppState.swift
//  EndavaTestReSwit
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import ReSwift

struct AppState: StateType {
  let routingState: RoutingState
  let newsSourcesState: NewsSourcesSate
  let newsFeedState: NewsFeedState
  let articleDetailsState: ArticleDetailsState
}
