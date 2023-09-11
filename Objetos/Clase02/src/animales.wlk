object nano {
	var energia = 100
	const responsable = "Ro"
	
	method responsable() = responsable
	
	method energia() = energia
	
	method comer(unosGramos) {
		energia += unosGramos * 2
	}
	
	method galopar(unaDistancia) {
		energia -= unaDistancia
	}
	
	method estaFeliz() {
		return true 
	}
	
	method recibirCuracion() {
		self.galopar(3)
		self.comer(3000)
		self.galopar(5)
	}
	
}

object pepita {
	var energia = 100
	var ciudad = "General Las Heras"
	const responsable = "Gus"
	
	method responsable() = responsable
	
	method energia() = energia
	
	method comer(unosGramos) {
		energia += unosGramos / 2
	}
	
	method volarHacia(unaCiudad) {
		ciudad = unaCiudad
		energia /= 2
	}
	
	method estaFeliz() {
		return ciudad == "Lihuel Calel"
	}
	
	method recibirCuracion() {
		self.volarHacia("Lihuel Calel")
	}
}

object kali {
	var energia = 100
	var edad = 10
	const responsable = "Dani"
	
	method responsable() = responsable 
	
	method energia() = energia
	
	method comer(unosGramos) {
		energia += unosGramos
	}
	
	method cumplirAnios() {
		edad += 1
	}
	
	method estaFeliz() {
		return energia > 30
	}
	
	method recibirCuracion() {
		self.comer(400)
	}
}

object poroto {
	var energia = 100
	
	method comer(unosGramos) {
		energia += unosGramos
	}
}
















