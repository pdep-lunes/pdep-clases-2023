import SuscripcionCategorica.infantil

class Juego {
	const nombre
	const precio
	const categoria
	
  method esDeCategoria(unaCategoria) {
    return categoria == unaCategoria
  }
  
  method seLlama(unNombre) {
    return nombre == unNombre
  }
  
  method saleMenosDe(unPrecio) {
    return precio < unPrecio
  }
  
  method jugar(unUsuario, unasHoras)
}

class JuegoDeTerror inherits Juego {
  override method jugar(unUsuario, unasHoras) {
    //unUsuario.tirarTodoAlBiiiip()
    unUsuario.suscripcion(infantil)
  }
}

class Moba inherits Juego {
  override method jugar(unUsuario, unasHoras) {
    unUsuario.pagar(30)
  }
}

class JuegoEstrategico inherits Juego {
  override method jugar(unUsuario, unasHoras) {
    unUsuario.aumentarHumor(5 * unasHoras)
  }
}

class JuegoViolento inherits Juego {
  override method jugar(unUsuario, unasHoras) {
    unUsuario.reducirHumor(10 * unasHoras)
  }
}
