import UIKit

/*
 ******************* DECLARACIÓN DE VARIABLES ********************
 
 Declaración explícita: Especificas el tipo de dato de la variable
 var str: String = "Hello, playground"
 
 
 Declaración implícita: Dejas que Swift asuma o reconosca el tipo de dato de la variable
 var str = "Hello, playground"
          
 */

var str1 = "Hello, playground"
var str2: String = "Hello, playground"

var precio = 2.5
var cantidad: Double = 3

var total = precio * cantidad

var numero1: Float = 1.1
var numero2: Double = 1.1
var numero3: CGFloat = 1.1
var numero4: NSNumber = 1.1


/*
 
 ******************* TIPOS DE VARIABLES ********************
 
 Mutable: Se declara con la palabra reservada "var" y permite relizar o cambiar el valor o dato de la variable
 Inmutable: Se declara con la palabra reservada "let" y NO permite relizar o cambiar el valor o dato de la variable
 */


//No cambian valor
let distancia1 = 4.5
let distancia2: Double = 4.5

//Pueden cambiar valor
var altura1 = 1.75
var altura2: Double = 1.75

altura1 = 1.76
altura2 = 2.76



/*
 ******************* FUNCIONES ********************
 
 argumento: Puede tener las siguientes partes
 
 * descripción variable: (texto, _, )
 * nombre variable: (variable)
 * tipo de dato: (tipoDato)
 
 func nombreDeFuncion(argumentos) -> TipoDatoRetorno {
 
 }
 */

//Primera forma (RECOMENDADO)
func imprimir(nombreUsuario nombre: String) {}
imprimir(nombreUsuario: "Kenyi")

func sumar(numero1 a: Int, conNumero2 b: Int) {}
sumar(numero1: 2, conNumero2: 4)

func registrarUsuario(conNombre nombre: String, conApellido apellido: String) {}
registrarUsuario(conNombre: "Kenyi", conApellido: "Rodriguez")

//Segunda forma (RECOMENDADO)

func imprimir(nombre: String) {}
imprimir(nombre: "Kenyi")

func sumar(a: Int, b: Int) {}
sumar(a: 2, b: 4)

func registrarUsuario(nombre: String, apellido: String) {}
registrarUsuario(nombre: "Kenyi", apellido: "Rodriguez")

//Tercera forma si tienes más de 1 parámetro (RECOMENDADO)
func sumarNumero1(_ a: Int, conNumero2 b: Int) {}
sumarNumero1(2, conNumero2: 4)

func registrarUsuarioConNombre(_ nombre: String, yApellido apellido: String) {}
registrarUsuarioConNombre("Kenyi", yApellido: "Rodriguez")


//Cuarta forma (NO RECOMENDADO)
func imprimir(_ nombre: String) {}
imprimir("hgcy ftghj gbhkhgb")

func sumar(_ a: Int, _ b: Int) {}
sumar(2, 4)

func registrarUsuario(_ nombre: String, _ apellido: String) {}
registrarUsuario("Kenyi", "Rodriguez")
