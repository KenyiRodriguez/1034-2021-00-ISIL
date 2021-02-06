//
//  CarTableViewCell.swift
//  Sesion05-02
//
//  Created by Kenyi Rodriguez on 25/01/21.
//

import UIKit

protocol CarTableViewCellDelegate {
    func carTableViewCell(_ cell: CarTableViewCell, pressDeleteOptionToCar objCar: Car)
    func carTableViewCell(_ cell: CarTableViewCell, pressSeeDetailOptionToCar objCar: Car)
    func carTableViewCell(_ cell: CarTableViewCell, pressEditOptionToCar objCar: Car)
}

class CarTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var imgCar           : UIImageView!
    @IBOutlet weak private var lblNombreModelo  : UILabel!
    @IBOutlet weak private var lblPais          : UILabel!

    var delegate: CarTableViewCellDelegate?
    
    public var objCar: Car! {
        didSet { self.updateData() }
    }

    private func updateData() {
        
        self.lblNombreModelo.text   = self.objCar.nombreAuto
        self.lblPais.text           = self.objCar.pais
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.imgCar.layer.cornerRadius = 10
    }
}

//MARK: - Actions configuration

extension CarTableViewCell {
    
    public var swipeActions: UISwipeActionsConfiguration {
        return UISwipeActionsConfiguration(actions: [self.createDeleteAction(), self.createSeeDetailAction(), self.createEditAction()])
    }
    
    private func createDeleteAction() -> UIContextualAction {
        
        let action = UIContextualAction(style: .destructive, title: "Eliminar") { (_, _, _) in
            self.delegate?.carTableViewCell(self, pressDeleteOptionToCar: self.objCar)
        }

        action.image = UIImage(systemName: "trash")
        return action
    }
    
    private func createSeeDetailAction() -> UIContextualAction {
        
        let action = UIContextualAction(style: .normal, title: "Ver más") { (_, _, _) in
            self.delegate?.carTableViewCell(self, pressSeeDetailOptionToCar: self.objCar)
        }
        
        action.backgroundColor = .black
        action.image = UIImage(systemName: "rectangle.stack.person.crop")
        return action
    }
    
    private func createEditAction() -> UIContextualAction {
        
        let action = UIContextualAction(style: .normal, title: "Editar") { (_, _, _) in
            self.delegate?.carTableViewCell(self, pressEditOptionToCar: self.objCar)
        }
        
        action.backgroundColor = .systemBlue
        action.image = UIImage(systemName: "square.and.pencil")
        return action
    }
}
