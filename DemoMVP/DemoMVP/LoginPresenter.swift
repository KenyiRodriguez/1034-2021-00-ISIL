//
//  LoginPresenter.swift
//  DemoMVP
//
//  Created by Kenyi Rodriguez on 8/03/21.
//

import UIKit

class LoginPresenter {
    
    private weak var controller: LoginViewController?
    
    init(controller: LoginViewController) {
        self.controller = controller
    }
    
    func viewDidLoad() {
        
        guard let controller = self.controller else { return }
        
        controller.setInputStyle(controller.txtUsuario)
        controller.setInputStyle(controller.txtPassword)
    }
    
    func doLogin() {
        
        guard let user = self.controller?.txtUsuario.text, user.count != 0 else {
            self.controller?.showErrorMessage("Usuario inválido")
            return
        }
        
        guard let password = self.controller?.txtPassword.text, password.count != 0 else {
            self.controller?.showErrorMessage("Contraseña inválida")
            return
        }
        
        self.controller?.showLoading(true)
        
        LoginModel.doLogin(user: user, password: password) { (userName) in
            print(userName)
            self.controller?.showLoading(false)
            self.controller?.goToHomeViewController()
            
        } error: { (errorMessage) in
            
            self.controller?.showLoading(false)
            self.controller?.showErrorMessage(errorMessage)
        }

    }
}
