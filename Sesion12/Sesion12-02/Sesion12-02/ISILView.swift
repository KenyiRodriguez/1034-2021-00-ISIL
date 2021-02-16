//
//  CustomView.swift
//  Sesion12-02
//
//  Created by Kenyi Rodriguez on 15/02/21.
//

import UIKit


@IBDesignable class ISILView: UIView {
    
    var style = Style() {
        didSet { self.updateAppereance() }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get { self.style.cornerRadius }
        set { self.style.cornerRadius = newValue }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { self.style.borderWidth }
        set { self.style.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor {
        get { self.style.borderColor }
        set { self.style.borderColor = newValue }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get { self.style.shadowColor }
        set { self.style.shadowColor = newValue }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get { self.style.shadowRadius }
        set { self.style.shadowRadius = newValue }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get { self.style.shadowOpacity }
        set { self.style.shadowOpacity = newValue }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get { self.style.shadowOffset }
        set { self.style.shadowOffset = newValue }
    }
}


//MARK: - Setup style in view
extension ISILView {
    
    struct Style {
        
        var cornerRadius        : CGFloat = 20
        var borderWidth         : CGFloat = 0
        var borderColor         : UIColor = .black
        var shadowColor         : UIColor = .black
        var shadowRadius        : CGFloat = 3
        var shadowOpacity       : Float = 0.3
        var shadowOffset        : CGSize = .zero
    }
    
    func updateAppereance() {
        
        self.layer.cornerRadius     = self.style.cornerRadius
        self.layer.borderWidth      = self.style.borderWidth
        self.layer.borderColor      = self.style.borderColor.cgColor
        self.layer.shadowColor      = self.style.shadowColor.cgColor
        self.layer.shadowRadius     = self.style.shadowRadius
        self.layer.shadowOpacity    = self.style.shadowOpacity
        self.layer.shadowOffset     = self.style.shadowOffset
    }
    
}
