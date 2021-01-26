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
    
}


















//****************** IMPLEMENTACIÓN PARA ARRAYS BIDIMENSIONALES *******************

//class CarListViewController: UIViewController {
//
//    var arrayAutos = [["S3", "ttRS", "RS3", "R8"], ["M2", "135M", "Z4"], ["A45 AMG", "SLK", "C250"]]
//}
//
//extension CarListViewController: UITableViewDataSource { //number, number, cellfor
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return self.arrayAutos.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        let arrayModelos = self.arrayAutos[section]
//        return arrayModelos.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let modelos = self.arrayAutos[indexPath.section]
//        let auto = modelos[indexPath.row]
//        print(auto)
//
////        print(self.arrayAutos[indexPath.section][indexPath.row])
//
//        /*
//
//         0,0 = s3
//         0,1 = ttrs
//         0,2 = rs3
//         0,3 = r8
//
//         1,0 = m2
//         1,1 = 135m
//         1,2 = z4
//
//         */
//
//
//        return UITableViewCell()
//    }
//}
