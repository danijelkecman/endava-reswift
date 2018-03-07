//
//  NewsFeedReducer.swift
//  EndavaTestReSwit
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import ReSwift

struct NewsFeedReducer {
  
  static func newsFeedReducer(action: Action, state: NewsFeedState?) -> NewsFeedState {
    var state = state ?? NewsFeedState(articles: [], selectedArticle: nil, showLoading: false)
    
    switch action {
    case _ as FetchFeedAction:
      state = NewsFeedState(articles: [], selectedArticle: nil, showLoading: true)
    case let setFeedAction as SetFeedAction:
      state.articles = setFeedAction.articles
      state.showLoading = false
    case let selectArticleAction as SelectArticleAction:
      state.selectedArticle = state.articles[selectArticleAction.articleIndex]
    default:
      break
    }
    
    return state
  }

}
