//
//  HomeViewController.swift
//  Sesion04-02
//
//  Created by Kenyi Rodriguez on 18/01/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var constraintBottomScroll: NSLayoutConstraint!
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
 
    //MARK: - Keyboard Methods
    @objc func keyboardWillShow(_ notification: Notification) {
    
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let keyboardSize = keyboardFrame.size
        
        UIView.animate(withDuration: animationDuration) {
            self.constraintBottomScroll.constant = keyboardSize.height
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.constraintBottomScroll.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    
    //MARK: - Life Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
}

/*

 viewDidLoad        ->  terminar de cargar
 viewWillAppear     ->  empieza a aparecer
 viewDidAppear      ->  termina de aparecer
 viewWillDisappear  ->  empieza a desaparecer
 viewDidDisappear   ->  termina de desaparecer
 deInit             ->  cuando se destruye
 
 */
