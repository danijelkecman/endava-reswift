//
//  NewsFeedState.swift
//  EndavaTestReSwit
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import ReSwift

struct NewsFeedState: StateType {
  var articles: [Article]
  var selectedArticle: Article?
  var showLoading: Bool
}
