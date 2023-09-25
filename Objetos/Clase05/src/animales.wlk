class Caballo inherits Animal {
	method comer(unosGramos) {
		energia += unosGramos * 2
	}
	
	method galopar(unaDistancia) {
		energia -= unaDistancia
	}
	
	override method estaFeliz() {
		return true 
	}
	
	override method recibirCuracion() {
		self.galopar(3)
		self.comer(3000)
		self.galopar(5)
	}
	
	override method pasarElTiempo(unTiempo) {
	  super(unTiempo)
	  self.galopar(2)
	}
}

class Golondrina inherits Animal {
	var ciudad

	method comer(unosGramos) {
		energia += unosGramos / 2
	}
	
	method volarHacia(unaCiudad) {
		ciudad = unaCiudad
		energia /= 2
	}
	
	override method estaFeliz() {
		return ciudad == "Lihuel Calel"
	}
	
	override method recibirCuracion() {
		self.volarHacia("Lihuel Calel")
	}
	
	override method pasarElTiempo(unTiempo) {
	  
	}
}

class Gato inherits Animal {
	method comer(unosGramos) {
		energia += unosGramos
	}
	
	override method estaFeliz() {
		return energia > 30
	}
	
	override method recibirCuracion() {
		self.comer(400)
	}
}

// Clase Abstracta - No tiene sentido semánticamente instanciarla
// Puede tener métodos abstractos o no
class Animal {
  var edad
  var energia
  const responsable
  
  method responsable() = responsable
  
  method energia() = energia
    
  method cumplirAnios() {
    edad += 1
  }
  
  method dormir() {
    if (self.estaFeliz()) energia *= 2
  }
  
  method llamadoAResponsable1() {
    return "¡" + self.responsableEnMayusculas() + "!"
  }

  method llamadoAResponsable2() {
    return "¡" + responsable.toUpperCase() + "!"
  }
    
  method responsableEnMayusculas() {
    return self.responsable().toUpperCase()
  }
  
  // Método abstracto - no tiene comportamiento, se usa sólo para indicar que
  // las subclases están obligadas a implementar este método
  method estaFeliz()
  
  method recibirCuracion()
  
  method pasarElTiempo(unTiempo) {
    energia += unTiempo
  }
}

object pegaso inherits Caballo(energia = 10000, edad = 80000, responsable = "Hércules") {
  var ciudad = "Atenas"
  
  method volarHacia(unaCiudad) {
    ciudad = unaCiudad
    energia /= 2
  }
  
  override method pasarElTiempo(unTiempo) {
    super(unTiempo)
    self.volarHacia("El Olimpo")
  }
  
  override method estaFeliz() {
    return super() && ciudad == "El Olimpo" 
  }
}

const nano = new Caballo(energia = 100, edad = 8, responsable = "Ro")
const pepita = new Golondrina(energia = 100, ciudad = "General Las Heras", edad = 5, responsable = "Gus")
const kali = new Gato(energia = 100, edad = 10, responsable = "Dani")
//const bla = new Animal(edad = 10, energia = 100, responsable = "Juli")

// Method Lookup