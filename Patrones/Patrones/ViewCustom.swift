//
//  ViewCustom.swift
//  Patrones
//
//  Created by Kenyi Rodriguez on 5/03/21.
//

import UIKit

class ViewCustom: UIView {
    
    @discardableResult func setFrame(_ frame: CGRect) -> ViewCustom {
        self.frame = frame
        return self
    }
    
    @discardableResult func cornerRadius(_ radius: CGFloat) -> ViewCustom {
        self.layer.cornerRadius = radius
        return self
    }
    
    @discardableResult func borderWidth(_ borderWidth: CGFloat) -> ViewCustom {
        self.layer.borderWidth = borderWidth
        return self
    }
    
    @discardableResult func borderColor(_ color: UIColor) -> ViewCustom {
        self.layer.borderColor = color.cgColor
        return self
    }
}
