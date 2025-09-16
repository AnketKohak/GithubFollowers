//
//  UIViewController+Ext.swift
//  GithubFollowers
//
//  Created by Anket Kohak on 16/09/25.
//

import UIKit

extension UIViewController{
    func presentGFAlertOnMainThread(title: String,message: String, buttonTitle: String){
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .coverVertical
            self.present(alertVC, animated: true)
            
        }
    }
}
