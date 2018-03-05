//
//  FetchSourcesAction.swift
//  EndavaTestReSwit
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import ReSwift

struct FetchSourcesAction: Action {
  
  static func fetchSources(state: AppState, store: Store<AppState>) -> FetchSourcesAction {
    NewsSourcesInteractor.getSourcesList { sources in
      store.dispatch(SetSourcesAction(sources: sources))
    }
    return FetchSourcesAction()
  }
  
}
