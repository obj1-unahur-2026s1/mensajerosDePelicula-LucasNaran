import destinos.*
object paquete {
    var property destino = puenteDeBrooklyn
    var estaPago = false
    method puedeEntregarse(mensajero) = destino.puedePasar(mensajero) && estaPago
    method registrarPago(){ estaPago = true }
    method rechazarPago() { estaPago = false }
    method precio() = 50
    method estaPago() = estaPago
}
object paquetito{
   var property destino = puenteDeBrooklyn
    method puedeEntregarse(mensajero) = destino.puedePasar(mensajero)
    method precio() = 0
    method estaPago() = true 
}
object paqueton{
    const destinos = #{}
    var importeAbonado = 0
    method precio() = destinos.size() * 100
    method registrarPago(valor){
        importeAbonado = (importeAbonado + valor) .min ( self.precio() )
    }
    method estaPago() = importeAbonado == self.precio()

    method agregarDestino(destino){
        destinos.add(destino)
    }

    method puedeEntregarse(mensajero) =
         self.estaPago() and destinos.all( {d => d.puedePasar(mensajero)} ) 
}