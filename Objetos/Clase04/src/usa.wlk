object homero {
  var calorias = 1000 
  
  method comer(unaComida) {
    calorias += unaComida.calorias()
  }
}

class Comida {
  const calorias
  
  method calorias() {
    return calorias
  }
}