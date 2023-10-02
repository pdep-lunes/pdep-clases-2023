import Beth.Beth
import NoPuedoIrmeDeViajeException.NoPuedoIrmeDeViajeException

class Summer inherits Beth {
  override method irseDeViaje(unRick) {
    if (self.esLunes()) {
      super(unRick)
    } else {
      throw new NoPuedoIrmeDeViajeException(message = "¡Sólo puedo irme de aventura los lunes!")
    }
  }
  
  method esLunes() {
    return new Date().dayOfWeek() == monday
  }
}