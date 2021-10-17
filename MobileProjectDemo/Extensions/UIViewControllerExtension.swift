//
//  UIViewControllerExtension.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 17/10/21.
//

import UIKit

extension UIViewController {
    func presentAlertController(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
}
