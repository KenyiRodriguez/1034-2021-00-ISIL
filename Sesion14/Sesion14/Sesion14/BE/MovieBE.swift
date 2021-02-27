//
//  MovieBE.swift
//  Sesion14
//
//  Created by Kenyi Rodriguez on 26/02/21.
//

import Foundation

class MovieBE {
    
    var title   : String
    var overview: String
    var urlImage: String
    
    init(json: JSON) {
        
        let domain = "https://image.tmdb.org/t/p/w500"
        let imagePath = json["poster_path"] as? String ?? ""
        
        self.title      = json["title"] as? String ?? ""
        self.overview   = json["overview"] as? String ?? ""
        self.urlImage   = "\(domain)\(imagePath)"
    }
}
