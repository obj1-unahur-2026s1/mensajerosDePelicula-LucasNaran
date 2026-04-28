
import destinos.*
import vehiculos.*

object viaje {

  var mensajero = roberto
  var vehiculo = true

  method paqueteEntregado(){  }

  method llegoADestino(){  }

  method paquetePago(){  }
}

object roberto {
  method peso() = 90
  method puedeLlamar() = false
}

object chuckNorris {
  method peso() = 80
  method puedeLlamar() = true
}

object neo {
  var credito = true
  method peso() = 0
  method puedeLlamar() = true
}