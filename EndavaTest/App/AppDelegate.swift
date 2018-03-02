//
//  AppDelegate.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/2/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit
import SwiftyBeaver

let log = SwiftyBeaver.self

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // NewsAPI Key: 66cfbd7746dc49cc92660dddd735e899

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = _instantiateViewController()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func _instantiateViewController() -> UINavigationController {
        let navigationController = UINavigationController()
        
        let wireframe = NewsSourcesWireframe(navigationController: navigationController)
        wireframe.show(with: .root)
        
        return navigationController
    }

}

