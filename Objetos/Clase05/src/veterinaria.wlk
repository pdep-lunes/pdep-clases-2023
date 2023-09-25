import animales.*

object huellitas {
	var botiquin = ["venda", "venda", "venda", "alcohol", "gasa"]
	var pacientes = #{}
	
	method botiquin() {
		return botiquin
	}
	
	method pacientes() {
		return pacientes
	}
	
	method agregar(unaLista, unElemento) {
		unaLista.add(unElemento)
	}
	
	method agregarAlBotiquin(unElemento) {
		self.agregar(botiquin, unElemento)
	}
	
	method agregarPaciente(unPaciente) {
		self.agregar(pacientes, unPaciente)
	}
	
	method darAlta(unPaciente) {
		pacientes.remove(unPaciente)
	}
	
	method cantidadDePacientes() {
		return pacientes.size()
	}
	
	method pacientesRecuperados() {
		return pacientes.filter({ paciente => paciente.estaFeliz() })
	}
	
	method responsablesDePacientes() {
		return pacientes.map({ paciente => paciente.responsable() })
	}
	
	method seNecesitaComprarVendas() {
		return botiquin.count({ elemento => elemento == "venda" }) < 3
	}
	
	method pacienteConMasEnergia() {
		return pacientes.max({ paciente => paciente.energia() })
	}
	
	method curar() {
		pacientes.forEach({ paciente => paciente.recibirCuracion() })
	}
}  
