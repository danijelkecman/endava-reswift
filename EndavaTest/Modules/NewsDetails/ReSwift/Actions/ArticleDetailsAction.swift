//
//  ArticleDetailsAction.swift
//  EndavaTestReSwit
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import ReSwift

struct ArticleDetailsAction: Action {
  
  static func getArticleDetails(state: AppState, store: Store<AppState>) -> ArticleDetailsAction {
    store.dispatch(SetArticleDetailsAction(article: state.newsFeedState.selectedArticle!))
    return ArticleDetailsAction()
  }

}
