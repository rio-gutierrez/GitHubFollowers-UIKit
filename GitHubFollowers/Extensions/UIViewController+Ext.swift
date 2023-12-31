//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Mario Luis on 12/31/23.
//

import UIKit

// It is not possible to present an alert from the background thread(s), so
// here we add the functionality to ensure the custom alert we define on
// `GFAlertVC` is called from the main thread
extension UIViewController {
    /// Call to present the alert implemented on`GFAlertVC`
    ///  - Parameters:
    ///     - alertTitle: String
    ///     - message: String
    ///     - buttonTitle: String
    ///
    ///  - Returns:Void
    func presentGFAlertOnMainThread(alertTitle: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: alertTitle, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
