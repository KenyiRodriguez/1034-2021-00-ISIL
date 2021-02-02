//
//  CarListViewController.swift
//  Sesion05-02
//
//  Created by Kenyi Rodriguez on 22/01/21.
//

import UIKit

class CarListViewController: UIViewController {

    @IBOutlet weak var tlbCars: UITableView!
    
    var arrayCars = [Car]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
                
        self.arrayCars.append(Car(marca: "Audi",
                                  modelo: "S3",
                                  pais: "Alemania"))
        
        self.arrayCars.append(Car(marca: "Audi",
                                  modelo: "TTS",
                                  pais: "Alemania"))
        
        self.arrayCars.append(Car(marca: "Porsche",
                                  modelo: "Cayman",
                                  pais: "Alemania"))
        
        self.arrayCars.append(Car(marca: "BMW",
                                  modelo: "M4",
                                  pais: "Alemania"))
    }
}

extension CarListViewController: UITableViewDataSource { //number, number, cellfor

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.arrayCars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cellIdentifier = "CarTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CarTableViewCell
        cell.objCar = self.arrayCars[indexPath.row]
        
        return cell
    }
}

extension CarListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as? CarTableViewCell
        cell?.animateCellSelection()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as? CarTableViewCell
        cell?.animateCellDeselection()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let cell = tableView.cellForRow(at: indexPath) as? CarTableViewCell
        return cell?.swipeActions
    }

}
