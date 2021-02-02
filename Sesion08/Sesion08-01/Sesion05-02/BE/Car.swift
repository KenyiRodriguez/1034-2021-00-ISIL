//
//  Car.swift
//  Sesion05-02
//
//  Created by Kenyi Rodriguez on 25/01/21.
//

import Foundation

class Car {
    
    private var marca   : String
    private var modelo  : String
    public  var pais    : String
    
    public var nombreAuto: String {
        return "\(self.marca) - \(self.modelo)"
    }
    
    init(marca: String, modelo: String, pais: String) {
        
        self.marca  = marca
        self.modelo = modelo
        self.pais   = pais
    }
}
