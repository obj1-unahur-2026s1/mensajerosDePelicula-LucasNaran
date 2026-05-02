import mensajeros.*
import paquetes.*
object mensajeria{
    const mensajeros=[]
    const paquetes = []
    const paquetesPendientes = []


    method contratarUnMensajero(mensajero){
        mensajeros.add(mensajero)
    }
    method despedirUnMensajero(mensajero){
        mensajeros.remove(mensajero)
    }
    method despedirATodos(){
        mensajeros.clear()
    }
    method cantidadDeEmpleados() {
       return mensajeros.size()
    }
    method esGrande(){
        return mensajeros.size()>2
    }
    method primerEmpleado(){
        return mensajeros.first()
    }
    method ultimoEmpleado(){
        return mensajeros.last()
    }
    method elPrimerEmpleadoPuedeEntregar(paquete){
        return paquete.puedeEntregarse(self.primerEmpleado())
    }
    method pesoUltimoMensajero(){
        return self.ultimoEmpleado().pesoTotal()
    }
    method pesoTotalDeTodosLosMensajeros(){
        return mensajeros.sum( { m => m.pesoTotal() } ) 
    }
    method todosLosPesosEnLista(){
        return mensajeros.map( { m => m.pesoTotal() } )
    }
    method almenosUnMensajeroPuedeEntregar(paquete){
        return mensajeros.any( { m => paquete.puedeEntregarse(m) } )
    }
    method losQuePuedenLlevar(paquete){
       return mensajeros.filter( { m => paquete.puedeEntregarse(m) } )
    }

    method sumarUnPaquete(paquete) {
      paquetes.add(paquete)
    }
    method primerPaqueteDeLaLista(){
       return paquetes.first()
    }
    method facturacionTotal(){
          return paquetes.sum( { m => m.precio() } ) 
    }
    method enviarTodosLosPaquetes(mensajero){
        paquetes.forEach( { p => p.puedeEntregarse(mensajero) } )
    }
    method sumarUnPaquetePendiente(paquete){
        paquetesPendientes.add(paquete)
    }
    method quitarUnPaquetePendiente(paquete){
        paquetesPendientes.remove(paquete)
    }    
    method paquetePendienteMasCaro(){
        return paquetesPendientes.max({ p => p.precio()})
    }
    method enviarPaquetePendiente(mensajero){
        self.paquetePendienteMasCaro().puedeEntregarse(mensajero)
        self.quitarUnPaquetePendiente(self.paquetePendienteMasCaro())
    }
    method enviarUnPaquete(mensajero){
        paquetes.findOrDefault ({p => p.puedeEntregarse(mensajero)})
    }  
 
}