//
//  ImageDownloader.swift
//  Sesion13
//
//  Created by Kenyi Rodriguez on 19/02/21.
//

import UIKit

extension UIImageView {
    
    typealias ImageSuccess = (_ image: UIImage?) -> Void
    
    func imageDownloadToUrl(_ urlString: String, success: @escaping ImageSuccess) {
        
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global(qos: .background).async {
            
            do {
                let dataImage = try Data(contentsOf: url)
                let image = UIImage(data: dataImage)
                
                DispatchQueue.main.async {
                    self.image = image
                    success(image)
                }

            }catch {
                print("Error en la descarga \(error.localizedDescription)")
            }
        }
    }
    
    func imageDownloadToUrl2(_ urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global(qos: .background).async {
            
            guard let dataImage = try? Data(contentsOf: url) else { return }
            let image = UIImage(data: dataImage)
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}

