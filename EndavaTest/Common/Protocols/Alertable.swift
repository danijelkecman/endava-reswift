//
//  Alertable.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/4/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

protocol Alertable {
    func showBasicAlert(message: String)
    func showBasicAlert(message: String, completion: @escaping () -> Void)
    func showDefaultErrorMessage()
    func showAlertWith(message: String, actions: [UIAlertAction]?, cancelAction: UIAlertAction?)
}

extension Alertable where Self: UIViewController {
    
    func showBasicAlert(message: String) {
        let alert = UIAlertController.basicAlert(message: message)
        if let navigationController = self.navigationController {
            navigationController.present(alert, animated: true, completion: nil)
        } else {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showBasicAlert(message: String, completion: @escaping () -> Void) {
        let alert = UIAlertController.basicAlert(message: message, completion: completion)
        if let navigationController = self.navigationController {
            navigationController.present(alert, animated: true, completion: completion)
        } else {
            self.present(alert, animated: true, completion: completion)
        }
    }
    
    func showDefaultErrorMessage() {
        showBasicAlert(message: "Generic Error")
    }
    
    func showAlertWith(message: String, actions: [UIAlertAction]?, cancelAction: UIAlertAction?) {
        let alert = UIAlertController.showAlertWith(message: message, actions: actions, cancelAction: cancelAction)
        if let navigationController = self.navigationController {
            navigationController.present(alert, animated: true, completion: nil)
        } else {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
