class Estudiante {
  const notas = []
  const materiasQueCursa = #{"Analisis I"}
  
  method promedio() {
    return notas.sum() / notas.size()
  }
  
  method recibirNota(unaNota) {
    notas.add(unaNota)
  }
  
  method esEjemplar() {
    return notas.all({ unaNota => unaNota >= 8 })
  }
  
  method cantidadExamenesDesaprobados() {
    return notas.count({ unaNota => unaNota < 6 })
  }
  
  method proximasMateriasACursar() {
    return materiasQueCursa.map({ materia => materia + "I" })
  }
}

class Oyente {
  method esEjemplar() {
    return true
  }
  
  method promedio() = 10
  
//  method promedioDeNotas() {
//    return 10
//  }

  method recibirNota(unaNota) {
    
  }
}

// Duck typing

const dani = new Estudiante(notas = [10], materiasQueCursa = #{"Matematica Discreta I"})
const valen = new Estudiante(notas = [1, 2, 3, 4])
const lu = new Estudiante(notas = [2, 2, 2, 6], materiasQueCursa = #{"Analisis de Sistemas I"})
const fran = new Oyente()