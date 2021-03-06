//
//  ProfileWS.swift
//  Patrones
//
//  Created by Kenyi Rodriguez on 5/03/21.
//

import Foundation

class ProfileWS {
    
    class func getNameProfile(token: String?) -> String {
        
        if let _ = token {
            return "Kenyi Rodriguez"
        }else{
            return "Sesión expirada"
        }
    }
}
