import mensajeros.*
import paquetes.*
object mensajeria{
    const mensajeros=[]
    const paquetes = []
    const paquetesPendientes = []

    method paquetes() = paquetes
    method paquetesPendientes() = paquetesPendientes

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
    method todosLosPesosEnLista(){
        return mensajeros.map( { m => m.pesoTotal() } )
    }
    method almenosUnMensajeroPuedeEntregar(paquete){
        return mensajeros.any( { m => paquete.puedeEntregarse(m) } )
    }
    method losQuePuedenLlevar(paquete){
       return mensajeros.filter( { m => paquete.puedeEntregarse(m) } )
    }
    method pesoTotalDeTodosLosMensajeros(){
        return mensajeros.sum( { m => m.pesoTotal() } ) 
    }
    method sumarUnPaquete(paquete) {
      paquetes.add(paquete)
    }
    method quitarUnPaquete(paquete) {
      paquetes.remove(paquete)
    }
    method enviarUnPaquete(paquete, mensajero){
        paquete.puedeEntregarse(mensajero)
    }
    
    method saberSiElPaquetePuedeEnviarse(paquete){
        if (self.almenosUnMensajeroPuedeEntregar(paquete)){            
            self.enviarUnPaquete(paquete, self.losQuePuedenLlevar(paquete).anyOne())
            self.quitarUnPaquete(paquete)
            self.quitarUnPaquetePendiente(paquete)
        }
        else{
            self.quitarUnPaquete(paquete)
            self.sumarUnPaquetePendiente(paquete)
        }
    }

    method sumarUnPaquetePendiente(paquete) {
      paquetesPendientes.add(paquete)
    }
    method facturacionTotal(){
          return paquetes.sum( { m => m.precio() } ) 
    }

    method enviarTodosLosPaquetes(unaLista){
        unaLista.forEach( { p => self.saberSiElPaquetePuedeEnviarse(p) } )
    }
    
    method primerPaqueteDeLaLista(){
       return paquetes.first()
    }

    method quitarUnPaquetePendiente(paquete){
        paquetesPendientes.remove(paquete)
    }    
    method paquetePendienteMasCaro(){
        return paquetesPendientes.max({ p => p.precio()})
    }
    method enviarPaquetePendienteMasCaro(){
        self.saberSiElPaquetePuedeEnviarse(self.paquetePendienteMasCaro())
    }
    method enviarUnPaquete(mensajero){
        paquetes.findOrDefault ({p => p.puedeEntregarse(mensajero)})
    }  
 
}