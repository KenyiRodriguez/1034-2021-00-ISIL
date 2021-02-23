import UIKit

func sumar(n1: Double, n2: Double) -> Double {
    
    //IMAGINA QUE ESTO DEMORA 50 segundos
    return n1 + n2
}


////Segundo 0
//let suma1 = sumar(n1: 30, n2: 30)
////Segundo 50
//let suma2 = sumar(n1: 40, n2: 80)
////Segundo 100
//let suma3 = sumar(n1: 50, n2: 50)
////Segundo 150
//let suma4 = sumar(n1: 80, n2: 10)
////Segundo 200
//let suma5 = sumar(n1: 90, n2: 30)
////Segundo 250
//let suma6 = sumar(n1: 20, n2: 70)
////300 segundos


typealias Resultado = (_ suma: Double) -> Void

func sumar(n1: Double, n2: Double, resultado: @escaping Resultado) {
    
    let delay = UInt64.random(in: 1...3)
    let dispatchTime = DispatchTime(uptimeNanoseconds: delay)
    DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
        
        let suma = n1 + n2
        resultado(suma)
    }
}

print("EJECUTA SUMA 1")
sumar(n1: 3, n2: 4) { (suma) in
    print("SUMA1: \(suma)")
}

print("EJECUTA SUMA 2")
sumar(n1: 3, n2: 14) { (suma) in
    print("SUMA2: \(suma)")
}

print("EJECUTA SUMA 3")
sumar(n1: 3, n2: 17) { (suma) in
    print("SUMA3: \(suma)")
}

print("EJECUTA SUMA 4")
sumar(n1: 3, n2: 9) { (suma) in
    print("SUMA4: \(suma)")
}

print("EJECUTA SUMA 5")
sumar(n1: 3, n2: 6) { (suma) in
    print("SUMA5: \(suma)")
}

