//
//  Router.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/4/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import Alamofire
import ReachabilitySwift

enum Router: URLRequestConvertible {
    fileprivate static let _baseUrl = URL(string: "https://newsapi.org/v1")!
    fileprivate static let _apiKey = "66cfbd7746dc49cc92660dddd735e899"
    
    fileprivate static let _reachability: Reachability? = {
        let reachability = Reachability.init()
        
        do {
            try reachability?.startNotifier()
        } catch {
            log.error("Unable to start reachability notifier")
        }
        
        return reachability
    }()
    
    case newsSource(language: String)
    case newsList(source: String)
    case news(url: String)
    
    fileprivate var method: HTTPMethod {
        switch self {
        case .newsSource, .newsList, .news:
            return .get
        }
    }
    
    fileprivate var path: String {
        switch self {
        case .newsSource(_):
            return "/sources"
        case .newsList(_):
            return "/articles"
        case .news(let url):
            return url
        }
    }
        
    func asURLRequest() throws -> URLRequest {
        let url = Router._baseUrl
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        if let reachability = Router._reachability, reachability.isReachable {
            urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        } else {
            urlRequest.cachePolicy = .returnCacheDataDontLoad
        }
        
        switch self {
        case let .newsSource(language):
            let queryItems = [URLQueryItem(name: "language", value: language)]
            var components = URLComponents(url: url.appendingPathComponent(path), resolvingAgainstBaseURL: true)
            components?.queryItems = queryItems
            urlRequest.url = components?.url!
            urlRequest = try JSONEncoding.default.encode(urlRequest)
            break
        case let .newsList(source):
            let queryItems = [URLQueryItem(name: "source", value: source),
                              URLQueryItem(name: "sortBy", value: "latest"),
                              URLQueryItem(name: "apiKey", value: Router._apiKey)]
            var components = URLComponents(url: url.appendingPathComponent(path), resolvingAgainstBaseURL: true)
            components?.queryItems = queryItems
            urlRequest.url = components?.url!
            urlRequest = try JSONEncoding.default.encode(urlRequest)
            break
        case let .news(url):
            urlRequest.url = URL(string: url)
            urlRequest = try JSONEncoding.default.encode(urlRequest)
            break
        }
        
        return urlRequest
    }
    
}




























