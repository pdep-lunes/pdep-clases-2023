import Text.Show.Functions ()

unaFuncion (x : xs) = "Cabeza: " ++ show x ++ " Cola: " ++ show xs
unaFuncion        _ = "No Matchea"

-- Data Persona = Persona {
--   nombre :: String,
--   edad :: Int
-- }
-- 
-- cumplirAños (Persona nombre edad) = Persona nombre (edad + 1)
-- 
--suma unNumero = unNumero + 5
--suma = \unNumero -> (+) 5 unNumero
--(+)

suma :: (Int -> Int)
suma = (+) 5 -- Notacion Point-free

--Expresiones Lambda
--Currificacion
suma3 = \numero1 -> \numero2 -> \numero3 -> numero1 + numero2 + numero3

--Recursividad

--Fold
{-
map
filter
length
sum
product
fold :: ...... -> [a] -> b

foldr (+) 0 [1,2,3,4,5]
foldr1 (+) [1,2,3,4,5]

[1,2,3,4,5]
15


(27 / 9) / 3
27 / (9 / 3)
(/)

foldl :: (a -> b -> b)
foldr :: (b -> a -> b)

ghci> foldl (/) 1 [27, 9, 3]
1.3717421124828531e-3
ghci> foldr (/) 1 [27, 9, 3]
9.0



foldl (/) 1 [27, 9, 3]
((1 / 27) / 9) / 3

(27 / (9 / (3 / 1)))
-}


aplicarTodas unValor unaListaDeFunciones = 
  foldr (\unaFuncion semilla -> unaFuncion semilla) unValor unaListaDeFunciones
--                                  5       (* 2)
--                                  10      (+ 1)
--                                  11      (^ 2)


--((((0 + 1) + 2) + 3) + 4) + 5


-- Lazy evaluation: Call by name + Sharing
-- 
-- cabeza (x : _) = x
-- 
-- (\(x : _) -> x) [1..]
-- 1
--   [2..]
-- 1 -- Termina!
-- 
-- head . filter (< 3) $ [5..]
-- 
-- Eager evaluation: Call by value
-- 
-- head [1..]
-- head [1,2,3,4,5,6,7,8,9,10.....] -- No termina
