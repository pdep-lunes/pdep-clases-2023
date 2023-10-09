class SuscripcionCategorica {
  const categoriaQueTePermiteJugar
  const precio
  
  method precio() {
    return precio
  }
  
  method permiteJugarA(unJuego) {
    return unJuego.esDeCategoria(categoriaQueTePermiteJugar)
  }
}

const infantil = new SuscripcionCategorica(categoriaQueTePermiteJugar = "Infantil", precio = 10)
const prueba = new SuscripcionCategorica(precio = 0, categoriaQueTePermiteJugar = "Demo")