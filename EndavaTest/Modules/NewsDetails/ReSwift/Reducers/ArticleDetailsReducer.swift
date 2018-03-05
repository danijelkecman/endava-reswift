//
//  ArticleDetailsReducer.swift
//  EndavaTestReSwit
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import ReSwift

struct ArticleDetailsReducer {
  
  static func articleDetailsReducer(action: Action, state: ArticleDetailsState?) -> ArticleDetailsState {
    var state = state ?? ArticleDetailsState(article: nil)
    
    switch action {
    case let setArticleDetailsAction as SetArticleDetailsAction:
      state.article = setArticleDetailsAction.article
    default:
      break
    }
    
    return state
  }

}
