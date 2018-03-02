//
//  NewsFeedCell.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/4/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit
import Reusable

class NewsFeedCell: UITableViewCell, NibReusable {

    // MARK: - IBOutlets -
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    
    func configure(with item: NewsFeedItem) {
        articleTitle.text = item.author
        articleDescription.text = item.title // String(item.description.characters.filter { !"\n\r".characters.contains($0) })
        articleImage.image(from: item.imageUrl)
    }
}
