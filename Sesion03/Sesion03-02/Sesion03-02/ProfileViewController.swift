//
//  ProfileViewController.swift
//  Sesion03-02
//
//  Created by Kenyi Rodriguez on 15/01/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
