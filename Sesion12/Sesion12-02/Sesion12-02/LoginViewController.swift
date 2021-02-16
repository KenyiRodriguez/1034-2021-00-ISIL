//
//  LoginViewController.swift
//  Sesion12-02
//
//  Created by Kenyi Rodriguez on 15/02/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var contentInputs    : ISILView!
    @IBOutlet weak var cnsCenterYContent: NSLayoutConstraint!
    @IBOutlet weak var txtEmail         : UITextField!
    @IBOutlet weak var txtPassword      : UITextField!
    @IBOutlet weak var loadingLogin: UIActivityIndicatorView!
    
    @IBAction func clickBtnLogin(_ sender: Any) {
        self.doLogin()
    }
    
    func doLogin() {
        
        self.view.endEditing(true)
        
        self.loadingLogin.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            self.loadingLogin.stopAnimating()
            self.performSegue(withIdentifier: "HomeViewController", sender: nil)
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardEvents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardEvents()
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
            case self.txtEmail: self.txtPassword.becomeFirstResponder()
            default: self.doLogin()
        }
    
        return true
    }
}


//MARK: - Keyboard Operation

extension LoginViewController {

    @IBAction func closeKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    func registerKeyboardEvents() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func unregisterKeyboardEvents() {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let frameKeyboard = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        let keyboardOriginY = frameKeyboard.origin.y
        let viewContentEndPositionY = self.contentInputs.frame.origin.y + self.contentInputs.frame.height + 20
        
        if keyboardOriginY < viewContentEndPositionY { //Validación para saber si el teclado tapa el contenedor
            
            UIView.animate(withDuration: animationDuration) {
                
                let delta = keyboardOriginY - viewContentEndPositionY
                self.cnsCenterYContent.constant = delta
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.cnsCenterYContent.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}


