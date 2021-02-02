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
        self.lblPais.text           = self.objCar.pais
    }
    
    public func selectStyle(_ isSelect: Bool) {
        
        self.layer.cornerRadius     = isSelect ? 20 : 0
        self.layer.shadowColor      = isSelect ? UIColor.black.cgColor : UIColor.clear.cgColor
        
        self.layer.shadowOffset     = .zero
        self.layer.shadowRadius     = isSelect ? 3 : 0
        self.layer.shadowOpacity    = isSelect ? 0.3 : 0
        self.layer.masksToBounds    = false
        
        self.transform              = isSelect ? CGAffineTransform(scaleX: 0.8, y: 0.8) : .identity
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.imgCar.layer.cornerRadius = 10
    }
}
