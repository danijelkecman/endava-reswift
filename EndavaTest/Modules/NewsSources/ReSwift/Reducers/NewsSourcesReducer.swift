//
//  NewsSourcesReducer.swift
//  EndavaTestReSwit
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import ReSwift

struct NewsSourcesReducer {
  
  static func newsSourcesReducer(action: Action, state: NewsSourcesSate?) -> NewsSourcesSate {
    var state = state ?? NewsSourcesSate(sources: [], selectedSource: nil, showLoading: false)
    
    switch action {
    case _ as FetchSourcesAction:
      state = NewsSourcesSate(sources: [], selectedSource: nil, showLoading: true)
    case let setSourcesAction as SetSourcesAction:
      state = NewsSourcesSate(sources: setSourcesAction.sources, selectedSource: nil, showLoading: false)
      state.showLoading = false
    case let selectSourceAction as SelectSourceAction:
      state.selectedSource = state.sources[selectSourceAction.sourceIndex]
    default:
      break
    }
    
    return state
  }
  
}
