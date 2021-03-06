//
//  ViewController.swift
//  Patrones
//
//  Created by Kenyi Rodriguez on 5/03/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
        if let session = SessionBE.shared {
            print("El token de la sesión es: \(session.token)")
        }else {
            print("La sesión no existe")
        }
        
        let viewCustom = ViewCustom()
        self.view.addSubview(viewCustom)
        
        let frame = CGRect(x: 0, y: 100, width: 40, height: 40)
        viewCustom.setFrame(frame).cornerRadius(10).borderWidth(3).borderColor(.red)
    }
   
}

