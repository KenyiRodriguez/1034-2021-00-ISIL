//
//  ProfileViewController.swift
//  Patrones
//
//  Created by Kenyi Rodriguez on 5/03/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = ProfileWS.getNameProfile(token: SessionBE.shared?.token)
        print("El nombre del usuario es: \(name)")
    }
}

