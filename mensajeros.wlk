
import vehiculos.*

object roberto {
  var peso = 90
  var property vehiculo = bicicleta
  method pesoTotal() = vehiculo.peso() + peso
  method puedeLlamar() = false
  method cambiarPeso(nuevoPeso){ peso = nuevoPeso }
}

object chuckNorris {
  var peso = 80
  method pesoTotal() = peso
  method puedeLlamar() = true
}

object neo {
  var peso = 0
  var credito = true 
  method pesoTotal() = peso 
  method cargarCredito(){ credito = true }
  method agotarCredito(){ credito = false }  
  method puedeLlamar() = credito
}
object maraton {
  var peso = 70
  method pesoTotal() = peso
  method puedeLlamar() = true
}