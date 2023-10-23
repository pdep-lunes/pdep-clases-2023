object pdepLibre {
	const usuarios = #{}
	const productos = []
	
	method penalizarAMorosos() {
	  self.usuariosMorosos().forEach { unUsuario => unUsuario.reducirPuntos(1000) }
	}
	
	method usuariosMorosos() {
	  return usuarios.filter { unUsuario => unUsuario.esMoroso() }
	}
	
	method actualizarNivelesDeUsuarios() {
	  usuarios.forEach { unUsuario => unUsuario.actualizarNivel() }
	}
}

// depth-first
// breadth-first