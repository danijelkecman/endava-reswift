//
//  Source.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/4/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Unbox

struct Source: Unboxable {
    let id: String
    let name: String
    let description: String
    let category: String
}

// MARK: - Unboxable protocol

extension Source {
  init(unboxer: Unboxer) throws {
    self.id = try unboxer.unbox(key: "id")
    self.name = try unboxer.unbox(key: "name")
    self.description = try unboxer.unbox(key: "description")
    self.category = try unboxer.unbox(key: "category")
  }
}
