//
//  AlertManager.swift
//  DemoMVP
//
//  Created by Kenyi Rodriguez on 8/03/21.
//

import UIKit

extension UIViewController {
    
    func showErrorMessage(_ errorMessage: String, title: String) {
        
        let alertController = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
        alertController.addAction(acceptAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
