//
//  WebServiceManager.swift
//  Sesion14
//
//  Created by Kenyi Rodriguez on 22/02/21.
//

import Foundation

typealias JSON      = [String: Any]
typealias JSONARRAY = [JSON]

extension WebServiceManager {
    
    enum Method: String {
        case mget    = "GET"
        case mpost   = "POST"
        case mput    = "PUT"
        case mdelete = "DELETE"
    }
    
    typealias ResponseService = (_ responseService: Any) -> Void
}

class WebServiceManager {
    
    class func doRequest(httpMethod: Method, urlString: String, responseService: @escaping ResponseService) {

        guard let url = URL(string: urlString) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        let urlSession = URLSession(configuration: sessionConfiguration)
        
        if httpMethod == .mget {
                
            let task = urlSession.dataTask(with: urlRequest) { (data, urlResponse, error) in
                let response = self.readResponse(data: data, urlResponse: urlResponse, error: error)
                print(response)
                
                DispatchQueue.main.async {
                    responseService(response)
                }
                
            }
            
            task.resume()
            
        } else {
            
            let task = urlSession.uploadTask(with: urlRequest, from: nil) { (data, urlResponse, error) in
                let response = self.readResponse(data: data, urlResponse: urlResponse, error: error)
                print(response)
                DispatchQueue.main.async {
                    responseService(response)
                }
            }
            
            task.resume()
            
        }
    }
    
    class func readResponse(data: Data?, urlResponse: URLResponse?, error: Error?) -> Any {
        
        guard let data = data else { return "Error en la trama" }
        
        do {
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        }catch {
            return "Error en la trama"
        }
    }
}
