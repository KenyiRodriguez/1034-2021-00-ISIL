import UIKit

class Engine {
    
    var fuelType: String
    var potency: String
    
    init(fuelType: String, potency: String) {
        self.fuelType = fuelType
        self.potency = potency
    }
}

class Transmition {
    
    var typeTransmition: String
    
    init(typeTransmition: String) {
        self.typeTransmition = typeTransmition
    }
}

class Car {
    
    private var engine: Engine
    private var transmition: Transmition
    private var modelName: String
    
    init(engine: Engine, transmition: Transmition, modelName: String) {
        self.engine         = engine
        self.transmition    = transmition
        self.modelName      = modelName
    }
    
    var information: String {
        return "\(self.modelName) tiene \(self.engine.potency) y usa gasolina de \(self.engine.fuelType) y tiene una transmisión \(self.transmition.typeTransmition)"
    }
}

func createAudiS3() -> Car {
    
    let engine = Engine(fuelType: "98", potency: "280HP")
    let transmition = Transmition(typeTransmition: "DSG Doble Embrague")

    let objCar = Car(engine: engine, transmition: transmition, modelName: "Audi S3")
    return objCar
}

func createToyotaCorrolla() -> Car {
    
    let engine = Engine(fuelType: "90", potency: "110HP")
    let transmition = Transmition(typeTransmition: "CVT VVTI")

    let objCar = Car(engine: engine, transmition: transmition, modelName: "Toyota Corrolla")
    return objCar
}

print(createAudiS3().information)
print(createToyotaCorrolla().information)
