//
//  NewsSourcesViewController.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/4/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//

import ReSwift
import PKHUD

final class NewsSourcesViewController: UIViewController, Progressable {

  // MARK: - IBOutlets, UI Elements -
  
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Private properties -
  
  fileprivate var tableDataSource: TableDataSource<SourceCell, Source>?
  
  // MARK: - Lifecycle -
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    store.subscribe(self) { $0.select { $0.newsSourcesState } }
    store.dispatch(RoutingAction(destination: .newsSources))
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    store.unsubscribe(self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    _configure()
    store.dispatch(FetchSourcesAction.fetchSources)
  }
  
  // MARK: - Private methods -
  
  func _configure() {
    let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(_refreshSources))
    navigationItem.rightBarButtonItem = refreshButton
    
    PKHUD.sharedHUD.dimsBackground = false
    PKHUD.sharedHUD.contentView = PKHUDProgressView()
    
    tableView.register(cellType: SourceCell.self)
    tableDataSource = TableDataSource(cellIdentifier: SourceCell.reuseIdentifier, models: []) { (cell, model) -> SourceCell in
      cell.configure(with: SourceItem(id: model.id, name: model.name, description: model.description))
      return cell
    }
    tableView.dataSource = tableDataSource
  }
  
  // MARK: - Actions -
  
  @objc func _refreshSources() {
    store.dispatch(FetchSourcesAction.fetchSources)
  }
}

// MARK: - Table View Delegate

extension NewsSourcesViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    store.dispatch(SelectSourceAction(sourceIndex: indexPath.row))
    store.dispatch(RoutingAction(destination: .feedList))
  }
}

// MARK: - Store subscriber delegate

extension NewsSourcesViewController: StoreSubscriber {
  func newState(state: NewsSourcesSate) {
    tableDataSource?.models = state.sources
    tableView.reloadData()
    
    state.showLoading ? PKHUD.sharedHUD.show() : PKHUD.sharedHUD.hide()
  }
}



















