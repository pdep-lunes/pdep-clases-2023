import NoPuedoIrmeDeViajeException.NoPuedoIrmeDeViajeException

class Rick {
	var demencia
	
	method irDeAventuraCon(unAcompaniante) {
    try {
      unAcompaniante.irseDeViaje(self)
    } catch unaExcepcion : NoPuedoIrmeDeViajeException {
      self.noAventurar()
    }
	}
	
	method aumentarDemencia(unaCantidad) {
	  demencia += unaCantidad
	}
	
	method disminuirDemencia(unaCantidad) {
	  demencia -= unaCantidad
	}
	
	method noAventurar() {
	  self.aumentarDemencia(1000)
	}
}
