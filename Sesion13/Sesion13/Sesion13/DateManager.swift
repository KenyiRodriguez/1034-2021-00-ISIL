//
//  DateManager.swift
//  Sesion13
//
//  Created by Kenyi Rodriguez on 19/02/21.
//

import Foundation

extension String {
    
    func toDateWithFormat(_ format: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        let date = dateFormatter.date(from: self)
        return date ?? Date()
    }
}

extension Date {
    
    func toStringWithFormat(_ format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "es_PE")

        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
