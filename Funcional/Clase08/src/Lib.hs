data Participante = Participante {
  nombre       :: String,
  trucos       :: [Truco],
  especialidad :: Plato
}

type Truco = Plato -> Plato

data Plato = Plato {
  dificultad  :: Int,
  componentes :: [Componente]
}

type Componente = (Ingrediente, Int)
type Ingrediente = String

endulzar :: Int -> Truco
endulzar unosGramos unPlato = agregarComponente "Azucar" unosGramos unPlato

salar :: Int -> Truco
salar = agregarComponente "Sal"

agregarComponente :: String -> Int -> Plato -> Plato
agregarComponente unNombre unosGramos unPlato = modificarComponentes (\unosComponentes -> (unNombre, unosGramos) : unosComponentes) unPlato
--agregarComponente unNombre unosGramos unPlato = modificarComponentes ((unNombre, unosGramos) :) unPlato

modificarComponentes :: ([Componente] -> [Componente]) -> Plato -> Plato
modificarComponentes unaFuncion unPlato = unPlato { componentes = unaFuncion . componentes $ unPlato }

darSabor :: Int -> Int -> Truco
darSabor unosGramosDeSal unosGramosDeAzucar unPlato = endulzar unosGramosDeAzucar . salar unosGramosDeSal $ unPlato

duplicarPorcion :: Truco
duplicarPorcion unPlato = modificarComponentes (map duplicarCantidad) unPlato

duplicarCantidad :: Componente -> Componente
duplicarCantidad (ingrediente, cantidad) = (ingrediente, cantidad * 2)

simplificar :: Truco
simplificar unPlato
  | esUnBardo unPlato = modificarComponentes (filter hayMucho) $ unPlato { dificultad = 5 }
 -- | esUnBardo unPlato = unPlato { dificultad = 5, componentes = filter ((>= 10). snd) (componentes unPlato) }
  | otherwise         = unPlato

hayMucho :: Componente -> Bool
hayMucho unComponente = snd unComponente >= 10
--hayMucho (_, unosGramos) = unosGramos >= 10

esUnBardo :: Plato -> Bool
esUnBardo unPlato = dificultad unPlato > 7 && cantidadDeComponentes unPlato > 5
--esUnBardo unPlato = dificultad unPlato > 7 && ((> 5) . cantidadDeComponentes) unPlato
--f (g (h x))

cantidadDeComponentes :: Plato -> Int
cantidadDeComponentes unPlato = length . componentes $ unPlato

esVegano :: Plato -> Bool
esVegano unPlato = not . any esProductoAnimal . componentes $ unPlato

esProductoAnimal :: Componente -> Bool
esProductoAnimal (ingrediente, _) = elem ingrediente productosAnimales

productosAnimales :: [Ingrediente]
productosAnimales = ["Leche", "Carne", "Huevo", "Manteca"]

pepeRonccino :: Participante
pepeRonccino = Participante "Pepe Ronccino" [darSabor 2 5, simplificar, duplicarPorcion] unPlatoComplejo

unPlatoComplejo = undefined
