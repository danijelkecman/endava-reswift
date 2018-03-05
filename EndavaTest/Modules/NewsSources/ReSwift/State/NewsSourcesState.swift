//
//  NewsSourcesState.swift
//  EndavaTestReSwit
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import ReSwift

struct NewsSourcesSate: StateType {
  var sources: [Source]
  var selectedSource: Source?
  var showLoading: Bool
}
