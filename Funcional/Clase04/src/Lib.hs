import Text.Show.Functions

unEntero :: Int
unEntero = 5

unFlotante :: Float
unFlotante = 3.14

autorDeElVisitante :: String
autorDeElVisitante = "Stephen King"

hojasDeElVisitante :: Int
hojasDeElVisitante = 592

-- Alias de tipos

type Titulo = String
type Autor = String
type CantidadDePaginas = Int
--type Libro = (Titulo, Autor, CantidadDePaginas)

-- Data

-- Data sin Record Syntax
--data Libro = UnLibro Titulo Autor CantidadDePaginas deriving (Eq, Show)

-- Data + Record Syntax
data Libro = UnLibro {
  titulo :: Titulo,
  autor :: Autor,
  cantidadDePaginas :: CantidadDePaginas
} deriving (Eq, Show)


elVisitante :: Libro
elVisitante = UnLibro "El Visitante" "Stephen King" 592

shingekiNoKyojin1 :: Libro
shingekiNoKyojin1 = UnLibro "Shingeki no Kyojin 1" "Hajime Isayama" 40

shingekiNoKyojin3 :: Libro
shingekiNoKyojin3 = UnLibro "Shingeki no Kyojin 3" "Hajime Isayama" 40

shingekiNoKyojin27 :: Libro
shingekiNoKyojin27 = UnLibro "Shingeki no Kyojin 27" "Hajime Isayama" 40

fundacion :: Libro
fundacion = UnLibro "Fundacion" "Isaac Asimov" 230

sandman5 :: Libro
sandman5 = UnLibro "sandman5" "Neil Gaiman" 35

sandman10 :: Libro
sandman10 = UnLibro "sandman10" "Neil Gaiman" 35

sandman12 :: Libro
sandman12 = UnLibro "sandman12" "Neil Gaiman" 35

eragon :: Libro
eragon = UnLibro "eragon" "Christopher Paolini" 544

eldest :: Libro
eldest = UnLibro "eldest" "Christopher Paolini" 704

brisignr :: Libro
brisignr = UnLibro "brisignr" "Christopher Paolini" 700

legado :: Libro
legado = UnLibro "legado" "Christopher Paolini" 811

type Biblioteca = [Libro]

miBiblioteca :: Biblioteca
miBiblioteca = [elVisitante, shingekiNoKyojin1, shingekiNoKyojin3, shingekiNoKyojin27, fundacion, sandman5, sandman10, sandman12, eragon, eldest, brisignr, legado]

listaDesordenada = [8, 5, 4]

--listaOrdenada = ordenar listaDesordenada

--ordenar :: Ord a => [a] -> [a]

--type String = [Char]

unString :: String
unString = "hola"

otroString :: [Char]
otroString = "hola"

vocales :: [Char]
vocales = "aeiouAEIOU"

length' :: [a] -> Int
length' unaLista = length unaLista

elem' :: Eq a => a -> [a] -> Bool
elem' unValor unaLista = elem unValor unaLista

concat' :: [[a]] -> [a]
concat' unaListaDeListas = concat unaListaDeListas

tail' :: [a] -> [a]
tail' unaLista = tail unaLista

head' :: [a] -> a
head' unaLista = head unaLista

-- Pattern matching!

--(String, Bool)
--(String, Bool, String)

--Valores
--Tipos
--Patrones

--nombreDeLaFuncion :: Mundo de los Tipos
--nombreDeLaFuncion Mundo de los patrones = Mundo de los valores

--cantidadDeLibros :: Biblioteca -> Int
--cantidadDeLibros unaBiblioteca = length unaBiblioteca
-- Sobredelegacion

promedioDePaginas :: Biblioteca -> Int
promedioDePaginas unaBiblioteca = div (cantidadDePaginasTotales unaBiblioteca) (length unaBiblioteca)

cantidadDePaginasTotales :: Biblioteca -> Int
cantidadDePaginasTotales unaBiblioteca = sum (map cantidadDePaginas unaBiblioteca)

cantidadDePaginasTotales' :: Biblioteca -> Int
cantidadDePaginasTotales' unaBiblioteca = sum . map cantidadDePaginas $ unaBiblioteca
--                                              ^^^^^^^^^^^^^^^^^^^^^
--                                                [Libro] -> [Int]
--                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^
--                                              [Libro] -> Int

-- + * - / 
-- length "Hola!"
-- length $ "Hola"


type Saga = [Libro]

sagaDeEragon :: Saga
sagaDeEragon = [eragon, eldest, brisignr, legado]

esLecturaObligatoria :: Libro -> Bool
esLecturaObligatoria unLibro = esDeStephenKing unLibro || perteneceASagaEragon unLibro || esFundacion unLibro

esLecturaObligatoria' :: Libro -> Bool
esLecturaObligatoria' (UnLibro _ "Stephen King" _) = True
esLecturaObligatoria' (UnLibro "Fundacion" "Isaac Asimov" 230) = True
esLecturaObligatoria' unLibro = perteneceASagaEragon unLibro

esDeStephenKing :: Libro -> Bool
esDeStephenKing unLibro = ((== "Stephen King") . autor) unLibro

perteneceASagaEragon :: Libro -> Bool
perteneceASagaEragon unLibro = elem unLibro sagaDeEragon

esFundacion :: Libro -> Bool
esFundacion unLibro = unLibro == fundacion

esFantasiosa :: Biblioteca -> Bool
esFantasiosa unaBiblioteca = any esLibroFantasioso unaBiblioteca

esDe :: Autor -> Libro -> Bool
esDe unAutor unLibro = ((== unAutor) . autor) unLibro

esLibroFantasioso :: Libro -> Bool
esLibroFantasioso unLibro = esDe "Christopher Paolini" unLibro || esDe "Neil Gaiman" unLibro

nombreDeLaBiblioteca :: Biblioteca -> String
nombreDeLaBiblioteca unaBiblioteca = sinVocales . concatenatoriaDeTitulos $ unaBiblioteca

sinVocales :: String -> String
sinVocales unString = filter (not . esVocal) unString

esVocal :: Char -> Bool
esVocal unCaracter = elem unCaracter "aeiouáéíóúAEIOUÁÉÍÓÚ"

concatenatoriaDeTitulos :: Biblioteca -> String
concatenatoriaDeTitulos unaBiblioteca = concatMap titulo unaBiblioteca

esBibliotecaLigera :: Biblioteca -> Bool
esBibliotecaLigera unaBiblioteca = all esLecturaLigera unaBiblioteca

esLecturaLigera :: Libro -> Bool
esLecturaLigera unLibro = ((<= 40) . cantidadDePaginas) unLibro

sumaDe3 :: Int -> Int -> Int -> Int
sumaDe3 numero1 numero2 numero3 = numero1 + numero2 + numero3

quitarVocales :: String -> String
quitarVocales unTexto = filter noEsVocal unTexto

noEsVocal :: Char -> Bool
noEsVocal unaLetra = not (esVocal unaLetra)

{-
esVocal :: Char -> Bool
esVocal unaLetra = elem unaLetra vocales

vocales :: [Char]
vocales = "aeiouAEIOUáéíóúÁÉÍÓÚ"

--Metodología Top-Down

nombreDeLaBiblioteca :: Biblioteca -> String
nombreDeLaBiblioteca unaBiblioteca = quitarVocales . concatenarNombresDeLibros $ unaBiblioteca

concatenarNombresDeLibros :: Biblioteca -> String
concatenarNombresDeLibros unaBiblioteca = concatMap titulo unaBiblioteca

titulo :: Libro -> Titulo
titulo (unTitulo, _, _) = unTitulo
-}

-- |x| =
--          x    si x >= 0
--         -x    si x < 0

modulo :: Int -> Int
modulo unNumero
  | unNumero >= 0 = unNumero
  | otherwise     = -unNumero

genero :: Libro -> String
genero (UnLibro _ "Stephen King" _)   = "Terror"
genero (UnLibro _ "Hajime Isayama" _) = "Manga"
genero unLibro
  | esLecturaLigera  unLibro = "Comic"
  | otherwise                = "Sin categoría"

esDeAutorJapones :: Libro -> Bool
esDeAutorJapones (UnLibro _ autor _) = autor == "Hajime Isayama"

-- Alias de tipo!
data Persona = UnaPersona String String Int deriving (Show, Eq)

gus :: Persona
gus = UnaPersona "Gustavo" "Trucco" 32
