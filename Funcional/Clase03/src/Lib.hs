import Text.Show.Functions

unEntero :: Int
unEntero = 5

unFlotante :: Float
unFlotante = 3.14

autorDeElVisitante :: String
autorDeElVisitante = "Stephen King"

hojasDeElVisitante :: Int
hojasDeElVisitante = 592

type Titulo = String
type Autor = String
type CantidadDePaginas = Int
type Libro = (Titulo, Autor, CantidadDePaginas)

elVisitante :: Libro
elVisitante = ("El Visitante", "Stephen King", 592)

shingekiNoKyojin1 :: Libro
shingekiNoKyojin1 = ("Shingeki no Kyojin 1", "Hajime Isayama", 40)

shingekiNoKyojin3 :: Libro
shingekiNoKyojin3 = ("Shingeki no Kyojin 3", "Hajime Isayama", 40)

shingekiNoKyojin27 :: Libro
shingekiNoKyojin27 = ("Shingeki no Kyojin 27", "Hajime Isayama", 40)

fundacion :: Libro
fundacion = ("Fundacion", "Isaac Asimov", 230)

sandman5 :: Libro
sandman5 = ("sandman5", "Neil Gaiman", 35)

sandman10 :: Libro
sandman10 = ("sandman10", "Neil Gaiman", 35)

sandman12 :: Libro
sandman12 = ("sandman12", "Neil Gaiman", 35)

eragon :: Libro
eragon = ("eragon", "Christopher Paolini", 544)

eldest :: Libro
eldest = ("eldest", "Christopher Paolini", 704)

brisignr :: Libro
brisignr = ("brisignr", "Christopher Paolini", 700)

legado :: Libro
legado = ("legado", "Christopher Paolini", 811)

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

autor :: Libro -> String
autor (_, autor, _) = autor

titulo :: Libro -> String
titulo (titulo, _, _) = titulo

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

cantidadDePaginas :: Libro -> Int
cantidadDePaginas (_, _, paginas) = paginas

promedioDePaginas :: Biblioteca -> Int
promedioDePaginas unaBiblioteca = div (cantidadDePaginasTotales unaBiblioteca) (length unaBiblioteca)

cantidadDePaginasTotales :: Biblioteca -> Int
cantidadDePaginasTotales unaBiblioteca = sum (map cantidadDePaginas unaBiblioteca)

cantidadDePaginasTotales' :: Biblioteca -> Int
cantidadDePaginasTotales' unaBiblioteca = sum . map cantidadDePaginas $ unaBiblioteca

type Saga = [Libro]

sagaDeEragon :: Saga
sagaDeEragon = [eragon, eldest, brisignr, legado]

esLecturaObligatoria :: Libro -> Bool
esLecturaObligatoria unLibro = esDeStephenKing unLibro || perteneceASagaEragon unLibro || esFundacion unLibro

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
esVocal unCaracter = elem unCaracter "aeiouAEIOUÁÉÍÓÚ"

concatenatoriaDeTitulos :: Biblioteca -> String
concatenatoriaDeTitulos unaBiblioteca = concatMap titulo unaBiblioteca

esBibliotecaLigera :: Biblioteca -> Bool
esBibliotecaLigera unaBiblioteca = all esLecturaLigera unaBiblioteca

esLecturaLigera :: Libro -> Bool
esLecturaLigera unLibro = ((<= 40) . cantidadDePaginas) unLibro
