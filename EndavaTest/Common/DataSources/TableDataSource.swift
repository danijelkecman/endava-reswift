//
//  TableViewDataSource.swift
//  EndavaTestReSwit
//
//  Created by Danijel Kecman on 8/8/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

final class TableDataSource<V, T>: NSObject, UITableViewDataSource where V: UITableViewCell {
  
  typealias CellConfiguration = (V, T) -> V
  
  var models: [T]
  private let configureCell: CellConfiguration
  private let cellIdentifier: String
  
  init(cellIdentifier: String, models: [T], configureCell: @escaping CellConfiguration) {
    self.cellIdentifier = cellIdentifier
    self.models = models
    self.configureCell = configureCell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? V
    
    guard let currentCell = cell else {
      fatalError("Identifier or class not registered with this table view")
    }
    
    let model = models[indexPath.row]
    return configureCell(currentCell, model)
  }
}
