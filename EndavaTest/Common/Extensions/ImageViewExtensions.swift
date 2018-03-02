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
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data!)
                self.image = image
            }
        }.resume()
    }
}
