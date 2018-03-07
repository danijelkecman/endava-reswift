//
//  NewsSourcesInteractor.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/4/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import Alamofire
import enum Result.Result

final class NewsSourcesInteractor {
}

// MARK: - Extensions -

extension NewsSourcesInteractor: NewsSourcesInteractorInterface {
  
  static func getSourcesList(completion: @escaping ([Source]) -> Void) {
    SessionManager.default.request(Router.newsSource(language: "en"))
      .responseArray(keyPath: "sources") { (result: Result<[Source], NetworkError>, response: DataResponse<Any>) in
        do {
          let sources = try result.dematerialize()
          completion(sources)
        } catch {
          log.error(error)
        }
    }
  }

}
