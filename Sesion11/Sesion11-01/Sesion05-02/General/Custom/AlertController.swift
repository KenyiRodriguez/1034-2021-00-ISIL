//
//  AlertController.swift
//  Sesion05-02
//
//  Created by Kenyi Rodriguez on 12/02/21.
//

import UIKit

extension UIViewController {
    
    func showAlertWithTitle(_ title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        self.present(alertController, animated: true) {
            
            let gesture = UITapGestureRecognizer(target: self, action: #selector(self.closeAlert))
            alertController.view.superview?.addGestureRecognizer(gesture)
        }
    }
    
    typealias TapButtonAlert = ()->Void
    
    func showAlertWithTitle(_ title: String, message: String, closeTitle: String, closeActionButton: TapButtonAlert?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: closeTitle, style: .cancel) { (_) in
            closeActionButton?()
        }
        
        alertController.addAction(closeAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func closeAlert() {
        self.dismiss(animated: true, completion: nil)
    }
}
