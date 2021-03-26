import UIKit

protocol Car {
    
    var brandName   : String { get set }
    var potency     : String { get set }
    var transmition : String { get set }
    var engine      : String { get set }
}

protocol Vehicule {
    
    var numberOfWheels: Int { get set }
}

class Audi: Car, Vehicule {
    
    var numberOfWheels: Int

    var brandName: String
    var potency: String
    var transmition: String
    var engine: String
    
    init(potency: String, transmition: String, engine: String, brandName: String) {
        self.brandName      = brandName
        self.potency        = potency
        self.transmition    = transmition
        self.engine         = engine
        self.numberOfWheels = 4
    }
    
    var rateSecurity: Double {
        return 4.8
    }
}

class Bmw: Car, Vehicule {
    
    var numberOfWheels: Int
    
    var brandName: String
    var potency: String
    var transmition: String
    var engine: String
    
    init(potency: String, transmition: String, engine: String, brandName: String) {
        self.brandName      = brandName
        self.potency        = potency
        self.transmition    = transmition
        self.engine         = engine
        self.numberOfWheels = 4
    }
    
    var laneAssist: Bool {
        return true
    }
}

class Mercedez: Car, Vehicule {
    
    var numberOfWheels: Int
    var brandName: String
    var potency: String
    var transmition: String
    var engine: String
    
    init(potency: String, transmition: String, engine: String, brandName: String) {
        self.brandName      = brandName
        self.potency        = potency
        self.transmition    = transmition
        self.engine         = engine
        self.numberOfWheels = 4
    }
}

enum Brand: Int {
    
    case audi       = 0
    case bmw        = 1
    case mercedez   = 2
    
    var vehicule: Vehicule {
    
        switch self {
            case .audi:     return Audi(potency: "280HP", transmition: "DSG", engine: "2.0T", brandName: "Audi")
            case .bmw:      return Bmw(potency: "480HP", transmition: "PDK", engine: "V6T", brandName: "BMW")
            case .mercedez: return Mercedez(potency: "420HP", transmition: "DSG", engine: "V6T", brandName: "Mercedez")
        }
    }
}

func createCars() {
    
    let serviceTypeCar = 1
    
    guard let brand = Brand(rawValue: serviceTypeCar),
          let objCar = brand.vehicule as? Car else {
        print("Marca de autos no registrada")=
        return
    }
    
    print("SOY UN \(objCar.brandName)")

}

createCars()
