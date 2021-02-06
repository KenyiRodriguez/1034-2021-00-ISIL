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
    
    
    //******** ESTE ES EL PEAJE DE TU CASA ********
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? CarDetailViewController {
            controller.objCar = sender as? Car
        }
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
        cell.delegate = self
        cell.objCar = self.arrayCars[indexPath.row]
        
        return cell
    }
}

extension CarListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //LLAMAR A LA VISTA DEL DETALLE
        
        let objCar = self.arrayCars[indexPath.row]
        self.performSegue(withIdentifier: "CarDetailViewController", sender: objCar)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let cell = tableView.cellForRow(at: indexPath) as? CarTableViewCell
        return cell?.swipeActions
    }

}

extension CarListViewController: CarTableViewCellDelegate {
    
    func carTableViewCell(_ cell: CarTableViewCell, pressDeleteOptionToCar objCar: Car) {
        
        //Se debe eliminar del array y de la tabla
        //Obtener ubicación de la celda en la tabla(IndexPath)
        guard let indexPath = self.tlbCars.indexPath(for: cell) else { return }
        
        //Eliminar elemento del array de autos
        self.arrayCars.remove(at: indexPath.row)
        
        //Eliminar celda de la tabla de autos
        //Ejecutar metodo de actualizar tabla (performBatchUpdate)
        self.tlbCars.performBatchUpdates {
            //ACA DEBES PONER LOS CAMBIOS A REALIZAR EN LA TABLA
            self.tlbCars.deleteRows(at: [indexPath], with: .right)
            
        } completion: { (_) in
            //SE LLAMA CUANDO TERMINA EL PROCESO DE CAMBIO DE LA TABLA
        }
    }
    
    func carTableViewCell(_ cell: CarTableViewCell, pressSeeDetailOptionToCar objCar: Car) {
        self.performSegue(withIdentifier: "CarDetailViewController", sender: objCar)
    }
    
    func carTableViewCell(_ cell: CarTableViewCell, pressEditOptionToCar objCar: Car) {
        print("pressEditOptionToCar")
    }
}
