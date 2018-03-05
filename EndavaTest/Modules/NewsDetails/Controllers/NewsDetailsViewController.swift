//
//  NewsDetailsViewController.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/4/17.
//  Copyright (c) 2017 Danijel Kecman. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import ReSwift
import PKHUD

final class NewsDetailsViewController: UIViewController {
  
  @IBOutlet weak var articleImage: UIImageView!
  @IBOutlet weak var articleAuthor: UILabel!
  @IBOutlet weak var articleTitle: UILabel!
  @IBOutlet weak var articleDescription: UILabel!
  @IBOutlet weak var articlePublishedAt: UILabel!
  
  // MARK: - Lifecycle -
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    store.subscribe(self) { $0.select { $0.articleDetailsState } }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    _configure()
    
    store.dispatch(ArticleDetailsAction.getArticleDetails)
  }
  
  // MARL: - Private Methods -
  
  private func _configure() {
    PKHUD.sharedHUD.dimsBackground = false
    PKHUD.sharedHUD.contentView = PKHUDProgressView()
  }
  
}

// MARK: - Store Subscription Delegate -

extension NewsDetailsViewController: StoreSubscriber {
  func newState(state: ArticleDetailsState) {
    guard let article = state.article else { return }
    articleTitle.text = article.title
    articleAuthor.text = article.author
    articleDescription.text = article.description
    articlePublishedAt.text = article.publishedAt
    articleImage.image(from: article.imageUrl)
    
    articleDescription.sizeToFit()
  }
}





















