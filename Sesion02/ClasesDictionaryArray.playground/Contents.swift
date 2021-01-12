import UIKit

class Persona {
    
    private var nombre: String
    private var apellido: String
    public var nombreCompleto: String {
        return "\(apellido), \(nombre)"
    }

    init(nombre: String, apellido: String) {
        self.nombre     = nombre
        self.apellido   = apellido
    }
}

//let arrayNotas0 = [] Esto no se puede HACER
let arrayNotas1 = [20]
let arrayNotas2 = [Int]()
let arrayNotas3: [Int] = []

//var arrayPersonas = [Persona]()

var arrayPersonas = [
                        Persona(nombre: "Kenyi", apellido: "Rodriguez"),
                        Persona(nombre: "Kerwin", apellido: "Sandoval")
                    ]

arrayPersonas.append(Persona(nombre: "Miguel", apellido: "Palacios"))
arrayPersonas.append(Persona(nombre: "Franco", apellido: "Matos"))


//Formas de iterar un array
/*
 
 for (int i = 0; i < arrayPersonas.length; i ++) {
    //Codigo Aquí
 }
 
 */

//Forma 1:
print("Forma 1: ***************************\n")
arrayPersonas.forEach { (objPersona) in
    print(objPersona.nombreCompleto)
}


//Forma 2:
print("\n\nForma 2: ***************************\n")
for objPersona in arrayPersonas {
    print(objPersona.nombreCompleto)
}


//Forma 3:
print("\n\nForma 3: ***************************\n")
for i in 0..<arrayPersonas.count {
    let objPersona = arrayPersonas[i]
    print(objPersona.nombreCompleto)
}


//Forma 4: TUPLES
print("\n\nForma 4: ***************************\n")
for (index, objeto) in arrayPersonas.enumerated() {
    print("\(index) - \(objeto.nombreCompleto)")
}



print("\n\nDiccionarios: ***************************\n")
//DICCIONARIO DE DATOS
var objAlumno = [String: Any]()
objAlumno["nombre"] = "Kenyi"
objAlumno["edad"] = 30
objAlumno["talla"] = 1.75

print(objAlumno["apellido"] ?? "Dato no disponible")

print("******************\n")

for (key, value) in objAlumno {
    print("\(key): \(value)")
}
   
var objAlumno2: [String: Any] = ["nombre"   : "Kerwin",
                                 "edad"     : 25,
                                 "talla"    : 1.70]
print(objAlumno2)



print("\n\n**********************************************\n")
//TYPE ALIAS CON DICCIONARIO Y ARRAY

typealias DiccionarioGenerico = [String: Any]

func crearAlumno(nombre: String, apellido: String) -> DiccionarioGenerico {
    
    let objAlumno: DiccionarioGenerico = ["nombre"    : nombre,
                                          "apellido"  : apellido]
    
    return objAlumno
}

var arrayAlumnos: [DiccionarioGenerico] = []
arrayAlumnos.append(crearAlumno(nombre: "Kenyi", apellido: "Rodriguez"))
arrayAlumnos.append(crearAlumno(nombre: "Kerwin", apellido: "Sandoval"))
arrayAlumnos.append(crearAlumno(nombre: "Miguel", apellido: "Palacios"))
arrayAlumnos.append(crearAlumno(nombre: "Rodrigo", apellido: "Prieto"))

for objAlumno in arrayAlumnos {
    
    let nombre = objAlumno["nombre"] ?? "Sin Nombre"
    let apellido = objAlumno["apellido"] ?? "Sin Apellido"
    
    let nombreCompleto = "\(apellido), \(nombre)"
    print(nombreCompleto)
}


print("\n\n**********************************************\n")

for (index, objeto) in arrayAlumnos.enumerated() {
    
    let nombre = objeto["nombre"] ?? "Sin Nombre"
    let apellido = objeto["apellido"] ?? "Sin Apellido"
    
    let nombreCompleto = "\(index) - \(apellido), \(nombre)"
    print(nombreCompleto)
}


print("\n\n**********************************************\n")

for (index, objeto) in arrayAlumnos.enumerated() {
    
    print("Alumno \(index + 1)")
    
    for (key, value) in objeto {
        print("\(key): \(value)")
    }
    print("-----------------------------\n")
}
