//
//  LoginModel.swift
//  DemoMVP
//
//  Created by Kenyi Rodriguez on 8/03/21.
//

import Foundation

class LoginModel {
    
    typealias Success = (_ userName: String) -> Void
    typealias ErrorMessage = (_ errorMessage: String) -> Void
    
    class func doLogin(user: String, password: String, success: @escaping Success, error: @escaping ErrorMessage) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            success("Kenyi Rodriguez")
        }
    }
}
