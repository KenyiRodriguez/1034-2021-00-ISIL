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
    
        
        let date = "03/05/2010 21:45:16".toDateWithFormat("dd/MM/yyyy HH:mm:ss")
        print(date)
        
        let stringDate = date.toStringWithFormat("dd 'de' MMMM 'del' yyyy 'a las' HH 'horas' mm'min' ss's'")
        print(stringDate)
        
        let urlString = "https://i.pinimg.com/originals/e1/9d/1f/e19d1f260149fbcce984abe6ea4cce3545.jpg"
        
        self.imgDemo.imageDownloadToUrl(urlString) { (_) in
            print("terminó de descargar")
        }
        
    }
    
    
}

