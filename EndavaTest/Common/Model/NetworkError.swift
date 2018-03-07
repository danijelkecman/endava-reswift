//
//  NetworkError.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/7/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Alamofire
import Unbox
import Result
import enum Result.Result

enum NetworkError: Error {
  case general
  case alamofire(AFError)
  case unbox(UnboxError)
  
  var message: String {
    switch self {
    case .general:
      return "General error"
    case .alamofire(let error):
      return "Alamofire error: \(error)"
    case .unbox(let error):
      return "Unbox error: \(error)"
    }
  }
}

extension NetworkError: ErrorConvertible {
  static func error(from error: Swift.Error) -> NetworkError {
    if error is UnboxError {
      return NetworkError.unbox(error as! UnboxError)
    } else {
      return NetworkError.alamofire(error as! AFError)
    }
  }
}

extension UnboxError: ErrorConvertible {
  public static func error(from error: Swift.Error) -> UnboxError {
    return error as! UnboxError
  }
}
