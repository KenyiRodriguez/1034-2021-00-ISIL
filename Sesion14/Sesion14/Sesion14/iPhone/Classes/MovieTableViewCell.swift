//
//  MovieTableViewCell.swift
//  Sesion14
//
//  Created by Kenyi Rodriguez on 26/02/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle     : UILabel!
    @IBOutlet weak var lblOverView  : UILabel!
    @IBOutlet weak var imgMovie     : UIImageView!
    
    var objMovie: MovieBE! {
        didSet { self.updateData() }
    }
    
    private func updateData() {
        
        self.lblTitle.text      = self.objMovie.title
        self.lblOverView.text   = self.objMovie.overview
        
        self.imgMovie.imageDownloadToUrl2(self.objMovie.urlImage)
    }
}
