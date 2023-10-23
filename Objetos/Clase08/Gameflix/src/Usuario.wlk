import SuscripcionCategorica.prueba
import NoPuedoJugarEsteJuegoException.NoPuedoJugarEsteJuegoException

class Usuario {
	var suscripcion
	var saldo
	
	method pagarSuscripcion() {
	  if (saldo >= suscripcion.precio()) {
	    saldo -= suscripcion.precio()
	  } else {
	    //suscripcion = prueba
	    self.suscripcion(prueba)
	  }
	}
	
	method suscripcion(unaSuscripcion) {
	  suscripcion = unaSuscripcion
	}
	
	method jugar(unJuego, unasHoras) {
	  if(suscripcion.permiteJugarA(unJuego)) {
	    unJuego.jugar(self, unasHoras)
	  } else {
	    throw new NoPuedoJugarEsteJuegoException(message = "La suscripcion no me permite jugar este juego")
	  }
	}
}

// Polimorfismo
// Encapsulamiento
// Asignación de responsabilidades