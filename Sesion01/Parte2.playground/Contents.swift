import UIKit

/*
 El opcional permite alojar dos posibles valores en una varible: El dato o nil(nulo, null)
 */

class Alumno {
    
    private var nombre      : String
    private var apellido    : String
    public  var numDoc      : String = ""
    public  var direccion   : String?
    
    public var nombreCompleto: String {
        return "\(self.nombre) \(self.apellido)"
    }
    
    public func imprimirInformacion() {
        print("Nombre: \(self.nombre)")
        print("Apellido: \(self.apellido)")
        print("Nombre Completo: \(self.nombreCompleto)")
        print("Dirección: \(self.direccion ?? "Sin Dirección")")
    }
    
    init(nombre: String, apellido: String) {
        self.nombre = nombre
        self.apellido = apellido
    }
}

let objAlumno1 = Alumno(nombre: "Kenyi", apellido: "Rodriguez")
//objAlumno1.direccion = "Av El Derby 1264"

objAlumno1.imprimirInformacion()


print("***********************************************\n\n")

func dividir(_ n1: Double, entre n2: Double) -> Double? {
    
    if n2 == 0 { return nil }
    return n1 / n2
}

func obtenerPrecio() -> Double {
    return 5
}

//FORMA FEA QUE SOLO HACEN LOS LOSERS
func realizarOperacionesObsoleto() {
    
    let resultado = dividir(2, entre: 0)
    
    if resultado == nil {
        print("Ocurrio un error")
    }else {
        print("El resultado es: \(resultado!)")
    }
}


/*
 guard let
 
 Sólo funciona dentro de un contexto o Scoope de una función
 SIRVE PARA CREAR VARIABLES SEGURAS
 Crear una variable segura en el contexto actual
 Te permite detener el flujo en caso encuentre un fallo en una variable insegura
*/

func realizarOperacionConGuardLet() {
    
    let precio = obtenerPrecio()
    
    guard let cantidad = dividir(2, entre: 0) else {
        print("No se pudo determinar la cantidad")
        return
    }
    
    let total = precio * cantidad
    
    print("El total es: \(total)")
}


realizarOperacionConGuardLet()


/*
 if let
 SIRVE PARA CREAR VARIABLES SEGURAS
 Las variables se crean en un nuevo contexto (no el actual)
 el else es opcional.., ya que el flujo puede ser cortado en el if o no..TODO DEPENDE DE LO QUE QUIERAS HACER
 */

func realizarOperacionConIfLet() {
 
    if let resultado = dividir(2, entre: 0) {
        print("El resultado es: \(resultado)")
    }else{
        print("Ocurrio un error")
    }
}




































//class AlumnoAlterno {
//
//    var nombre      : String = "Sin definir"
//    var apellido    : String = "Sin definir"
//    var numDoc      : String = "Sin definir"
//    var direccion   : String?
//}
//
//let objAlumno2 = AlumnoAlterno()
//print("nombre: \(objAlumno2.nombre)")
