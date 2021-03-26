//
//  ViewController.swift
//  DemoMVP
//
//  Created by Kenyi Rodriguez on 8/03/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsuario   : UITextField!
    @IBOutlet weak var txtPassword  : UITextField!
    @IBOutlet weak var loadingLogin : UIActivityIndicatorView!
    
    lazy private var presenter: LoginPresenter = {
       
        let presenter = LoginPresenter(controller: self)
        return presenter
    }()
    
    @IBAction func clickBtnLogin(_ sender: Any) {
        self.presenter.doLogin()
    }
    
    func goToHomeViewController() {
        self.performSegue(withIdentifier: "HomeViewController", sender: nil)
    }
    
    func showLoading(_ show: Bool) {
        
        show ? self.loadingLogin.startAnimating() : self.loadingLogin.stopAnimating()
        self.view.isUserInteractionEnabled = !show 
    }
    
    func showErrorMessage(_ errorMessage: String) {
        
        let alertController = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
        alertController.addAction(acceptAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setInputStyle(_ textField: UITextField) {
        
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 5
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowOffset = .zero
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
}

