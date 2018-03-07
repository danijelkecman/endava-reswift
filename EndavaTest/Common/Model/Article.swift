//
//  NewsList.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/3/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Unbox

struct Article: Unboxable {
    let author: String
    let title: String
    let description: String
    let url: String
    let imageUrl: String
    var publishedAt: String
}

// MARK: - Unboxable protocols -
extension Article {
  init(unboxer: Unboxer) throws {
    self.author = unboxer.unbox(key: "author") ?? "Author"
    self.title = try unboxer.unbox(key: "title")
    self.description = unboxer.unbox(key: "description") ?? "Description"
    self.url = try unboxer.unbox(key: "url")
    self.imageUrl = unboxer.unbox(key: "urlToImage") ?? "null"
    
    self.publishedAt = unboxer.unbox(key: "publishedAt") ?? "null"
    if self.publishedAt != "null" {
      // let formatter = ISO8601DateFormatter()
      let isoFormatter = DateFormatter()
      isoFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
      isoFormatter.locale = Locale(identifier: "en_US_POSIX")
      // 2017-08-06 14:00:44 +0000
      
      let publishedAt = try String(describing: unboxer.unbox(keyPath: "publishedAt", formatter: isoFormatter))
      let index = publishedAt.index(publishedAt.startIndex, offsetBy: 19)
      self.publishedAt = String(publishedAt[..<index])
    }
  }
}
