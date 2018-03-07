//
//  SourceCell.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/4/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit
import Reusable

class SourceCell: UITableViewCell, NibReusable {
    
    @IBOutlet weak var sourceName: UILabel!
    
    func configure(with item: SourceItem) {
        sourceName.text = item.name
    }
}
