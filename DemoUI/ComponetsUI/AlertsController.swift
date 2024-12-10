//
//  AlertsController.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 7/11/24.
//

import UIKit

extension UIViewController {
    func showErrorAlertWithMessage(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .default) { _ in
            alertController.dismiss(animated: true)
        }
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
}
