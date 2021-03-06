//
//  SessionBE.swift
//  Patrones
//
//  Created by Kenyi Rodriguez on 5/03/21.
//

import Foundation

class SessionBE {
    
    static var shared: SessionBE?

    private var internalToken: String
    
    var token: String {
        return self.internalToken
    }

    private init(token: String) {
        self.internalToken = token
    }
    
    class func initSingleton(token: String) {
        SessionBE.shared = SessionBE(token: token)
    }
}
