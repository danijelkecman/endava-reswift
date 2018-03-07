//
//  AlertControllerExtensions.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/4/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import UIKit

extension UIAlertController {
    class func basicAlert(message: String) -> UIAlertController {
        let alertController = UIAlertController(title: "Endava", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        return alertController
    }
    
    class func basicAlert(message: String, completion: @escaping () -> Void) -> UIAlertController {
        let alertController = UIAlertController(title: "Endava", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { (_) in
            completion()
        }
        alertController.addAction(action)
        return alertController
    }
    
    class func cancelAlert(title: String, message: String, confirmButtonTitle: String, confirmClosure: @escaping () -> Void) -> UIAlertController {
        let alertController = UIAlertController(title: "Endava", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (_) in
            confirmClosure()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(action)
        alertController.addAction(cancelAction)
        return alertController
    }
    
    class func showAlertWith(message: String, actions: [UIAlertAction]?, cancelAction: UIAlertAction?) -> UIAlertController {
        let alertController = UIAlertController(title: "Endava", message: message, preferredStyle: .alert)
        if let actions = actions {
            for action in actions {
                alertController.addAction(action)
            }
        }
        if let cancelAction = cancelAction {
            alertController.addAction(cancelAction)
        }
        return alertController
    }
}
