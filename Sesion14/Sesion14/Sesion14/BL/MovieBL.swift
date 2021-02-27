//
//  MovieBL.swift
//  Sesion14
//
//  Created by Kenyi Rodriguez on 26/02/21.
//

import Foundation

class MovieBL {
    
    class func getAllMovies(_ success: @escaping Movies) {
        
        MovieWS.getAllMovies { (arraMovies) in
        
            let arrayMoviesSorted = arraMovies.sorted(by: {
                $0.title < $1.title //Se ordena por nombre de película
            })
            
            success(arrayMoviesSorted)
        }
    }
}
