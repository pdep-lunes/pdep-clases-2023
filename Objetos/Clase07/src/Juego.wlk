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
}
