//
//  AddCarViewController.swift
//  Sesion05-02
//
//  Created by Kenyi Rodriguez on 12/02/21.
//

import UIKit

protocol AddCarViewControllerDelegate {
    func addCarViewController(_ controller: AddCarViewController, saveCar objCar: Car)
}

class AddCarViewController: UIViewController {
    
    @IBOutlet weak var txtMarca         : UITextField!
    @IBOutlet weak var txtModelo        : UITextField!
    @IBOutlet weak var txtPais          : UITextField!
    @IBOutlet weak var txtUrlImagen     : UITextField!
    @IBOutlet weak var bottonCnsScroll  : NSLayoutConstraint!
    
    var delegate: AddCarViewControllerDelegate?
    
    @IBAction func clickBtnAgregar(_ sender: Any) {
        
        guard let marca = self.txtMarca.text, marca.count != 0 else {
            self.showAlertWithTitle("Autos Perú", message: "Ingresa una marca", closeTitle: "Aceptar", closeActionButton: nil)
            return
        }
        
        guard let modelo = self.txtModelo.text, modelo.count != 0 else {
            self.showAlertWithTitle("Autos Perú", message: "Ingresa un modelo", closeTitle: "Aceptar", closeActionButton: nil)
            return
        }
        
        guard let pais = self.txtPais.text, pais.count != 0 else {
            self.showAlertWithTitle("Autos Perú", message: "Ingresa un país válido")
            return
        }
        
        guard let urlImagen = self.txtUrlImagen.text, urlImagen.count != 0 else {
            self.showAlertWithTitle("Autos Perú", message: "Ingresa una url válida")
            return
        }
  
        let objCar = Car(marca      : marca,
                         modelo     : modelo,
                         pais       : pais,
                         urlImagen  : urlImagen)

        //MANDO CONSUMO DE SERVICIO ENVIANDO LA DATA QUE QUIERO GUARDAR
        //PERO COMO NO TENGO SERVICIO UTILIZO DELEGADOS
        self.delegate?.addCarViewController(self, saveCar: objCar)
        
        self.showAlertWithTitle("Autos Perú", message: "El elemento se agregó con éxito", closeTitle: "Aceptar") {
            self.navigationController?.popViewController(animated: true) //Para retroceder una vista en la navegación
        }
    }
    
    @IBAction func tapCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addKeybordObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeKeyboardObservers()
    }
}


//MARK: - Eventos de teclado
extension AddCarViewController {
    
    func addKeybordObservers() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        let keyboardAnimationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let keyboardSize = keyboardFrame.size
        
        UIView.animate(withDuration: keyboardAnimationDuration) {
            self.bottonCnsScroll.constant = keyboardSize.height
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        let keyboardAnimationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: keyboardAnimationDuration) {
            self.bottonCnsScroll.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}
