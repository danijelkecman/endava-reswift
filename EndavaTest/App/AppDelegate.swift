//
//  AppDelegate.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/2/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import ReSwift
import SwiftyBeaver

let log = SwiftyBeaver.self
let store = Store<AppState>(reducer: AppReducer.appReducer, state: nil)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var approuter: AppRouter?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    log.addDestination(ConsoleDestination())
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    window.makeKeyAndVisible()
    approuter = AppRouter(window: window)
    
    return true
  }
  
}

