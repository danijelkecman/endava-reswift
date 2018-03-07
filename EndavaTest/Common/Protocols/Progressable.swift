//
//  Progressable.swift
//  EndavaTest
//
//  Created by Danijel Kecman on 8/3/17.
//  Copyright © 2017 Danijel Kecman. All rights reserved.
//

import MBProgressHUD

protocol Progressable {
    func showLoading()
    func hideLoading()
}

extension Progressable where Self: UIViewController {
    func showLoading() {
        showLoading(withMessage: "")
    }
    
    func showLoading(withMessage message: String) {
        showHUD(withMessage: message)
    }
    
    func hideLoading() {
        if self is UITableViewController {
            MBProgressHUD.hide(for: self.navigationController?.view ?? self.view, animated: true)
        } else {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    fileprivate func showHUD(withMessage message: String? = nil, customView: UIView? = nil, hideAfter: TimeInterval? = nil) {
        let progressHUD: MBProgressHUD
        
        if self is UITableViewController {
            progressHUD = MBProgressHUD.showAdded(to: self.navigationController?.view ?? self.view, animated: true)
        } else {
            progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        progressHUD.label.text = message
        progressHUD.animationType = .zoom
        
        if let hideAfter = hideAfter {
            progressHUD.hide(animated: true, afterDelay: hideAfter)
        }
    }
}
