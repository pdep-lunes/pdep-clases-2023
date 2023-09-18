import estudiantes.*

object ale {
  var cfd = 3
  const cursantes = #{lu, dani, valen, fran}
  
  method estudiantesEjemplares() {
    return cursantes.filter({ cursante => cursante.esEjemplar() })
  }
  
  method promedioDelCurso() {
    return cursantes.sum({ cursante => cursante.promedio() }) / cursantes.size()
  }
  
  method darNota() {
    const notaDelExamen = self.notaDelExamen()
    cursantes.forEach({ cursante => cursante.recibirNota(notaDelExamen) })
  }
  
  method notaDelExamen() {
    return cfd + self.promedioDelCurso()
  }
  
  method agregarCursante(unCursante) {
    cursantes.add(unCursante)
  }
  
  method darDeAltaNuevoEstudiante() {
    cursantes.add(new Estudiante())
  }
}