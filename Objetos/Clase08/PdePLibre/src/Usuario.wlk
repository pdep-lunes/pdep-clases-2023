import niveles.*
import MeQuedeSinEspacioEnElCarritoException.MeQuedeSinEspacioEnElCarritoException

class Usuario {
  const nombre
  const carrito = []
  const cupones = []
  
  var saldo
  var puntos = 0
  var nivel = bronce
  
  method agregarAlCarrito(unProducto) {
    if (nivel.permiteAgregar(carrito.size())) {
      carrito.add(unProducto)
    } else {
      throw new MeQuedeSinEspacioEnElCarritoException()
    }
  }
  
  method comprarCarrito() {
    const cuponSinUsar = self.cuponSinUsar()
    cuponSinUsar.usar()
    const precioAPagar = cuponSinUsar.precioFinalAPagar(self.precioCarrito())
    saldo -= precioAPagar
    self.sumarPuntos(precioAPagar)
  }
  
  method precioCarrito() {
    return carrito.sum { unProducto => unProducto.precioFinal() }
  }
  
  method cuponSinUsar() {
    return cupones.filter { unCupon => !unCupon.fueUsado() }.anyOne()
  }
  
  method sumarPuntos(unPrecioPagado) {
    puntos += unPrecioPagado * 0.1
  }
  
  method esMoroso() {
    return saldo < 0
  }
  
  method reducirPuntos(unaCantidad) {
    puntos -= unaCantidad
  }
  
  method actualizarNivel() {
    nivel = self.nivelSegunPuntos()
  }
  
  method nivelSegunPuntos() {
    if (puntos < 5000) return bronce
    else if (puntos < 15000) return plata
    
    return oro
  }
  
  method quitarCuponesUsados() {
    cupones.removeAllSuchThat { unCupon => unCupon.fueUsado() }
  }
}
