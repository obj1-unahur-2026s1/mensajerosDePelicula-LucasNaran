

object bicicleta {
  method peso() = 5
}

object camion {
    var  acoplados = 1

    method acoplados(valor){ acoplados=valor }

    method peso() = acoplados * 500
}
