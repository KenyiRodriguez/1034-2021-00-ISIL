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

//MARK: - Selection Style

extension CarTableViewCell {
    
    private func selectStyle(_ isSelect: Bool) {
        
        self.layer.cornerRadius     = isSelect ? 20 : 0
        self.layer.shadowColor      = isSelect ? UIColor.black.cgColor : UIColor.clear.cgColor
        self.layer.shadowOffset     = .zero
        self.layer.shadowRadius     = isSelect ? 3 : 0
        self.layer.shadowOpacity    = isSelect ? 0.3 : 0
        self.layer.masksToBounds    = false
        self.transform              = isSelect ? CGAffineTransform(scaleX: 0.8, y: 0.8) : .identity
    }
    
    public func animateCellSelection() {
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.4, options: .curveEaseOut) {
            self.selectStyle(true)
        } completion: { (_) in
            print("Termino la animación")
        }
    }
    
    public func animateCellDeselection() {
        
        UIView.animate(withDuration: 0.3) {
            self.selectStyle(false)
        }
    }
}

//MARK: - Actions configuration

extension CarTableViewCell {
    
    public var swipeActions: UISwipeActionsConfiguration {
        return UISwipeActionsConfiguration(actions: [self.createDeleteAction(), self.createSeeDetailAction(), self.createEditAction()])
    }
    
    private func createDeleteAction() -> UIContextualAction {
        
        let action = UIContextualAction(style: .destructive, title: "Eliminar") { (_, _, _) in
            print("TOCO ELIMINAR")
        }

        action.image = UIImage(systemName: "trash")
        return action
    }
    
    private func createSeeDetailAction() -> UIContextualAction {
        
        let action = UIContextualAction(style: .normal, title: "Ver más") { (_, _, _) in
            print("TOCO VER DETALLE")
        }
        
        action.backgroundColor = .black
        action.image = UIImage(systemName: "rectangle.stack.person.crop")
        return action
    }
    
    private func createEditAction() -> UIContextualAction {
        
        let action = UIContextualAction(style: .normal, title: "Editar") { (_, _, _) in
            print("TOCO EDITAR")
        }
        
        action.backgroundColor = .systemBlue
        action.image = UIImage(systemName: "square.and.pencil")
        return action
    }
}
