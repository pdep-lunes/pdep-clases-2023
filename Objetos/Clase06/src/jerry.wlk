import NoPuedoIrmeDeViajeException.NoPuedoIrmeDeViajeException

object jerry {
  method irseDeViaje(unRick) {
    throw new NoPuedoIrmeDeViajeException(message = "¡Soy tonto y no puedo irme de aventuras!")
  }
}