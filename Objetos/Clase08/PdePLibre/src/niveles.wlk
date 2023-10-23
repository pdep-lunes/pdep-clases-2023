class NivelConLimiteDeProductos {
  const limite
  
  method permiteAgregar(unCantidadProductos) {
    return unCantidadProductos < limite
  }
}

const bronce = new NivelConLimiteDeProductos(limite = 1)
const plata = new NivelConLimiteDeProductos(limite = 5)

object oro {
  method permiteAgregar(unCantidadProductos) {
    return true
  }
}