class ElJuegoNoExisteException inherits Exception {
  const nombreDelJuego
  
  override method message() {
    return "No existe un juego llamado " + nombreDelJuego
  }
}