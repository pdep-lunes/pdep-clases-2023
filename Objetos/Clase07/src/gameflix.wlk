import ElJuegoNoExisteException.ElJuegoNoExisteException

object gameflix {
  const juegos = []
  const clientes = []
  
  method juegosDeCategoria(unaCategoria) {
    // return juegos.filter { unJuego => unJuego.categoria().equals(unaCategoria) } // Rompe el encapsulamiento
    return juegos.filter { unJuego => unJuego.esDeCategoria(unaCategoria) }
  }
  
  method juegoLlamado(unNombre) {
    //return juegos.find({ unJuego => unJuego.seLlama(unNombre) }) // vale, peeeeero se podría devolver un error propio
    return juegos.findOrElse({ unJuego => unJuego.seLlama(unNombre) }, { throw new ElJuegoNoExisteException(nombreDelJuego = unNombre) })
  }
  
  method juegoRecomendado() {
    return juegos.anyOne()
  }
  
  method cobrarSuscripciones() {
    clientes.forEach { unCliente => unCliente.pagarSuscripcion() }
  }
}
