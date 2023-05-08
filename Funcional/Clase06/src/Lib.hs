import Text.Show.Functions ()
-- Forma "tradicional" de crear una función
doble :: Int -> Int
doble unNumero = unNumero * 2

-- Composición
-- doble . siguiente $ unNumero

-- Aplicación Parcial
-- (+) 5 :: Int -> Int

-- Expresiones Lambda
-- (\unNumero -> unNumero * 2)

-- Cuando usar lambdas:
-- No tenemos un mejor nombre para esa función.
-- No las podemos usar más de una vez.
-- No podés usar guardas
-- No podés usar pattern matching (con más de una ecuación)

dobles :: Num a => [a] -> [a]
dobles unaListaDeNumeros = map (\unNumero -> unNumero * 2) unaListaDeNumeros -- los numeros multiplicados por 2

siguiente :: Int -> Int
siguiente unNumero = unNumero + 1

siguiente' :: (Int -> Int)
siguiente' = (\unNumero -> unNumero + 1)

sumaDe3 :: Int -> Int -> Int -> Int
sumaDe3 numero1 numero2 numero3 = numero1 + numero2 + numero3

sumaDe3' :: (Int -> Int -> Int -> Int)
sumaDe3' = (\numero1 numero2 numero3 -> numero1 + numero2 + numero3)
--         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--                        (Int -> Int -> Int -> Int)


sumaDe3'' :: (Int -> (Int -> Int -> Int))
sumaDe3'' = (\numero1 -> (\numero2 numero3 -> numero1 + numero2 + numero3))

-- Currificación: El proceso de convertir una función que toma N parametros
--                en una cadena de N funciones que toman 1 parámetro.

sumaDe3''' :: (Int -> (Int -> (Int -> Int)))
sumaDe3''' = (\numero1 -> (\numero2 -> (\numero3 -> numero1 + numero2 + numero3)))

factorial :: Int -> Int
factorial        0 = 1
factorial unNumero = unNumero * factorial (unNumero - 1)

fibonacci :: Int -> Int
fibonacci        0 = 0
fibonacci        1 = 1
fibonacci unNumero = fibonacci (unNumero - 1) + fibonacci (unNumero - 2)

-- 0 1 1 2 3 5 8 13 21 34 ...

longitud :: [a] -> Int
longitud []       = 0
longitud unaLista = longitud (tail unaLista) + 1

longitud' :: [a] -> Int
longitud'         [] = 0
longitud' (_ : cola) = 1 + longitud cola

patronesDeListas :: Show a => [a] -> String
patronesDeListas                         [] = "Lista vacia"
patronesDeListas               [unElemento] = "Lista con un elemento: " ++ show unElemento
patronesDeListas [unElemento, otroElemento] = "Lista con dos elementos: " ++ show unElemento ++ " y " ++ show otroElemento
patronesDeListas            (cabeza : cola) = "Lista con cabeza: " ++ show cabeza ++ " y cola: " ++ show cola

sumatoria :: [Int] -> Int
sumatoria              [] = 0
sumatoria (cabeza : cola) = cabeza + sumatoria cola

productoria :: [Int] -> Int
productoria              [] = 1
productoria (cabeza : cola) = cabeza * productoria cola

and' :: [Bool] -> Bool
and'              [] = True
and' (cabeza : cola) = cabeza && and' cola

or' :: [Bool] -> Bool
or'              [] = False
or' (cabeza : cola) = cabeza || or' cola

todos :: (a -> Bool) -> [a] -> Bool
todos            _              [] = True
todos unaCondicion (cabeza : cola) = unaCondicion cabeza && todos unaCondicion cola

alguno :: (a -> Bool) -> [a] -> Bool
alguno            _              [] = False
alguno unaCondicion (cabeza : cola) = unaCondicion cabeza || alguno unaCondicion cola


foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr'        _ casoBase              [] = casoBase
foldr' operador casoBase (cabeza : cola) = cabeza `operador` foldr' operador casoBase cola
--                                 ^^^^^^^^^^^^^^^   ^^^^^^            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--                                      (a : [a])       a                                 a
--                                        [a]

sumatoria' :: [Int] -> Int
sumatoria' unaLista = foldr' (+) 0 unaLista

productoria' :: [Int] -> Int
productoria' unaLista = foldr' (*) 1 unaLista

todos' :: (a -> Bool) -> [a] -> Bool
todos' unaCondicion unaLista = foldr (\cabeza otroValor -> unaCondicion cabeza && otroValor) True unaLista


-- sum, map, concat, concatMap, filter
-- [1, 2, 3, 4]
-- 1 : [2, 3, 4]
-- 1 : 2 : [3, 4]
-- 1 : 2 : 3 : [4]
-- 1 : 2 : 3 : 4 : []


filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' unaCondicion (cabeza : cola)
  | unaCondicion cabeza = cabeza : filter' unaCondicion cola
  | otherwise           = filter' unaCondicion cola

--filter unaLista = foldr () [] unaLista

-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- foldl :: (b -> a -> b) -> b -> [a] -> b
-- foldr1 :: (a -> a -> a) -> [a] -> a
-- foldl1 :: (a -> a -> a) -> [a] -> a

-- foldr (+) 0 [1, 2, 3, 4]
-- 1 + foldr (+) 0 [2,3,4]
-- 1 + (2 + foldr (+) 0 [3,4])
-- 1 + (2 + (3 + foldr (+) 0 [4]))
-- 1 + (2 + (3 + (4 + foldr (+) 0 [])))
-- 1 + (2 + (3 + (4 + 0)))
-- 
-- foldr1 (+) [1,2,3,4]
-- 
-- foldl (+) 0 [1, 2, 3, 4]
-- (((0 + 1) + 2) + 3) + 4
-- 
-- foldl1


-- unaFuncion <un patron> = "Matchea"
-- unaFuncion           _ = "No Matchea"

-- ¿Que pasa cuando hago `unaFuncion <un valor>`?
