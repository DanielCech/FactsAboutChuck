//
//  UIViewController+Alerts.swift
//  STRV Project template
//
//  Created by Jan Kaltoun on 04/12/2018.
//  Copyright © 2018 STRV. All rights reserved.
//

import UIKit

extension UIViewController {
    func showErrorAlert(title: String, message: String) {
        guard presentedViewController == nil else {
            return
        }

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(
            title: R.string.localizable.generalErrorActionOkTitle(),
            style: .default
        )
        alertController.addAction(okAction)

        present(alertController, animated: true)
    }
}
