//
//  ViewController.swift
//  Sesion13
//
//  Created by Kenyi Rodriguez on 19/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgDemo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString1 = "https://api.themoviedb.org/4/list/1?api_key=752cd23fdb3336557bf3d8724e115570&page=1"

        WebServiceManager.doRequest(httpMethod: .mget, urlString: urlString1) { (json) in
            
            let jsonDic = json as? [String: Any] ?? [:]
            
            let nombre      = jsonDic["nombre"] as? String ?? "Sin nombre"
            let apellido    = jsonDic["apellido"] as? String ?? "Sin apellido"
            let edad        = jsonDic["edad"] as? String ?? "Sin edad"
            
        }
    }
}
