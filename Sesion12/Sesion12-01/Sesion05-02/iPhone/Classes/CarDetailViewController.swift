//
//  CarDetailViewController.swift
//  Sesion05-02
//
//  Created by Kenyi Rodriguez on 5/02/21.
//

import UIKit

class CarDetailViewController: UIViewController {
    
    @IBOutlet weak var lblCarModelAndBrand  : UILabel!
    @IBOutlet weak var lblCountry           : UILabel!
    
    var objCar: Car!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblCountry.text = self.objCar.pais
        self.lblCarModelAndBrand.text = self.objCar.nombreAuto
    }
}
