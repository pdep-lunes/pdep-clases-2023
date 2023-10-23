class Cupon {
	const descuento
	var fueUsado = false
	
	method fueUsado() {
	  return fueUsado
	}
	
	method precioFinalAPagar(unPrecio) {
	  return unPrecio * (1 - descuento)
	}
	
	method usar() {
	  fueUsado = true
	}
}
