//
//  CarTableViewCell.swift
//  Sesion05-02
//
//  Created by Kenyi Rodriguez on 25/01/21.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var imgCar           : UIImageView!
    @IBOutlet weak private var lblNombreModelo  : UILabel!
    @IBOutlet weak private var lblPais          : UILabel!
    
    public var objCar: Car! {
        didSet {
            self.updateData()
        }
    }
    
    private func updateData() {
        
        self.lblNombreModelo.text   = self.objCar.nombreAuto
        self.lblPais.text          = self.objCar.pais
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.imgCar.layer.cornerRadius = 10
    }
}
