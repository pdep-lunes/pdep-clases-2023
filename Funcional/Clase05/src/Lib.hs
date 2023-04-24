import Text.Show.Functions ()

data Jugador = UnJugador {
  nombre      :: Nombre,
  cantDinero  :: Int,
  tactica     :: String,
  propiedades :: [Propiedad],
  acciones    :: [Accion]
} deriving Show

type Propiedad = (Nombre, Precio)
type Nombre = String
type Precio = Int

--data Propiedad = UnaPropiedad {
--  nombre :: String,
--  precio :: Precio
--}

type Accion = Jugador -> Jugador

pasarPorElBanco :: Accion
pasarPorElBanco unJugador = (cambiarTacticaACompradorCompulsivo . agregarPlata 40) unJugador

agregarPlata :: Int -> Jugador -> Jugador
agregarPlata unaCantidad (UnJugador nombre cantidadDeDinero tactica propiedades acciones) =
  UnJugador nombre (cantidadDeDinero + unaCantidad) tactica propiedades acciones

agregarPlata' :: Int -> Jugador -> Jugador
agregarPlata' unaCantidad alguienQueJuega =
  UnJugador (nombre alguienQueJuega) (cantDinero alguienQueJuega + unaCantidad) (tactica alguienQueJuega) (propiedades alguienQueJuega) (acciones alguienQueJuega)

agregarPlata'' :: Int -> Jugador -> Jugador
agregarPlata'' unaCantidad alguienQueJuega = alguienQueJuega { cantDinero = cantDinero alguienQueJuega + unaCantidad }

cambiarTacticaACompradorCompulsivo :: Jugador -> Jugador
cambiarTacticaACompradorCompulsivo alguienQueJuega = alguienQueJuega { tactica = "Comprador compulsivo" }

carolina :: Jugador
carolina = UnJugador { nombre = "Carolina", tactica = "Accionista", acciones = [pasarPorElBanco], cantDinero = 500, propiedades = [] }

carolina' :: Jugador
carolina' = UnJugador "Carolina" 500 "Accionista" [] [pasarPorElBanco]

enojarse :: Accion
enojarse unJugador = agregarAccion gritar . agregarPlata 50 $ unJugador

agregarAccion :: Accion -> Jugador -> Jugador
agregarAccion unaAccion unJugador = unJugador { acciones = unaAccion : acciones unJugador }

gritar :: Accion
gritar unJugador = unJugador { nombre = "AHHHH" ++ nombre unJugador }

-- Precedencia
-- Parentesis
-- Aplicacion prefija
-- .
-- ....
-- $


{-
Album de fotos

Repositorio -> Album
Commits -> Fotos de nuestro proyecto

git init                            -> Crear un album de fotos en la carpeta actual
git clone <url del repositorio>     -> Descargar copia del album
git status                          -> Ver el estado de la "escena"
git add src/Lib.hs                  -> Meter un archivo en la "escena"
git commit -m "Un nombre expresivo" -> Sacar una foto
git push origin HEAD                -> Sube las fotos nuevas de mi local al remoto
git pull                            -> Descarga las fotos nuevas del remoto al local


git config --global user.name "Julián Berbel Alt"
git config --global user.email "julianberbel@gmail.com"

Repositorio local en nuestra compu
Repositorio remoto en github
-}
