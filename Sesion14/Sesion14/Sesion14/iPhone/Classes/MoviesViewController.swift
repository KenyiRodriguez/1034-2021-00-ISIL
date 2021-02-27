//
//  MoviesViewController.swift
//  Sesion14
//
//  Created by Kenyi Rodriguez on 26/02/21.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var tlbMovies: UITableView!
    
    var arrayMovies = [MovieBE]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getAllMovies()
    }
    
    func getAllMovies() {
        
        MovieBL.getAllMovies { (arrayMoviesResponse) in
            
            self.arrayMovies = arrayMoviesResponse
            self.tlbMovies.reloadData()
        }
    }
}

extension MoviesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MovieTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MovieTableViewCell
        cell.objMovie = self.arrayMovies[indexPath.row]
        
        return cell
    }
}

extension MoviesViewController: UITableViewDelegate {
    
}
