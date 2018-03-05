//
//  ImageViewExtensions.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/4/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

extension UIImageView {
  public func image(from url: String) {
    guard let url = URL(string: url) else {
      self.image = UIImage(named: "news-icon")
      return
    }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if error != nil {
        log.error(error!.localizedDescription)
        return
      }
      DispatchQueue.main.async {
        let image = UIImage(data: data!)
        self.image = image
      }
      }.resume()
  }
}
