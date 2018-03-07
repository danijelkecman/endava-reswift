//
//  FetchFeedAction.swift
//  EndavaTestReSwit
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import ReSwift

struct FetchFeedAction: Action {
  
  static func fetchFeed(state: AppState, store: Store<AppState>) -> FetchFeedAction {
    NewsFeedListInteractor.getNewsFeedListFrom(source: state.newsSourcesState.selectedSource!.id) { articles in
      store.dispatch(SetFeedAction(articles: articles))
    }
    
    return FetchFeedAction()
  }

}
