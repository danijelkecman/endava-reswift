//
//  AppReducer.swift
//  EndavaTestReSwit
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import ReSwift

struct AppReducer {
  static func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(routingState: RoutingReducer.routingReducer(action: action, state: state?.routingState),
                    newsSourcesState: NewsSourcesReducer.newsSourcesReducer(action: action, state: state?.newsSourcesState),
                    newsFeedState: NewsFeedReducer.newsFeedReducer(action: action, state: state?.newsFeedState),
                    articleDetailsState: ArticleDetailsReducer.articleDetailsReducer(action: action, state: state?.articleDetailsState))
  }

}
