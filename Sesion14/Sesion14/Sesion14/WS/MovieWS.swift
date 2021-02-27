//
//  MovieWS.swift
//  Sesion14
//
//  Created by Kenyi Rodriguez on 26/02/21.
//

import Foundation

typealias Movies = (_ arrayMovies: [MovieBE]) -> Void

class MovieWS {
    
    class func getAllMovies(_ success: @escaping Movies) {
        
        let urlString = "https://api.themoviedb.org/4/list/1?api_key=752cd23fdb3336557bf3d8724e115570&page=1"

        WebServiceManager.doRequest(httpMethod: .mget, urlString: urlString) { (response) in
            
            let json = response as? JSON ?? [:]
            let arrayResults = json["results"] as? JSONARRAY ?? []
            
            var arrayMovies = [MovieBE]()
            
            for objJSON in arrayResults {
                let objMovie = MovieBE(json: objJSON)
                arrayMovies.append(objMovie)
            }
            
            success(arrayMovies)
        }
    }
}
