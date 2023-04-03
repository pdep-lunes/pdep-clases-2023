frecuenciaCardiacaPromedio :: Int
frecuenciaCardiacaPromedio = 80

hacerActividadFisica :: Int -> Int
hacerActividadFisica unaFrecuencia = unaFrecuencia + 50

tieneTaquicardia :: Int -> Bool
tieneTaquicardia unaFrecuencia = unaFrecuencia >= 180

tieneTaquicardiaDespuesDeEntrenar2Veces :: Int -> Bool
tieneTaquicardiaDespuesDeEntrenar2Veces unaFrecuencia =
  (tieneTaquicardia . hacerActividadFisica . hacerActividadFisica) unaFrecuencia

{-
Precedencia de operadores:
- paréntesis
- aplicacion prefija
- .
- * / `div`
- + -
- &&
- ||
- >=, <=
- $
-}
-- tieneTaquicardia . hacerActividadFisica $ frecuenciaCardiacaPromedio

{-
Funciones prefijas
- tieneTaquicardia
- not
- hacerActividadFisica
- id
- const
- div

Funciones prefijas aplicadas de forma infija: `div`

Funciones infijas (aka "chirimbolos")
- +
- -
- *
- /
- .
- $

Funciones infijas aplicadas de forma prefija: (+) 5 1

Tipos de datos
- Int
- Integer
- Float
- Double
- Bool
- Char
- String

Type classes / Familias de tipos
- Num:
  - +
  - -
  - *
- Eq:
  - ==
  - /=
- Ord
  - <=
  - <
  - >
  - >=
- Show
  - show
- Fractional
  - /
- Integral
  - div
-}

suma :: Int -> Int -> Int
suma unNumero otroNumero = unNumero + otroNumero
-- Compila, no nos deja sumar flotantes

suma' :: Float -> Float -> Float
suma' unNumero otroNumero = unNumero + otroNumero
-- Compila, no nos deja sumar enteros

-- suma'' :: unTipo -> otroTipo -> oooootroTipo
-- suma'' unNumero otroNumero = unNumero + otroNumero
-- No compila!

suma''' :: Num a => a -> a -> a
suma''' unNumero otroNumero = unNumero + otroNumero

pi' :: Float
pi' = 3.14159265358979

identidad :: unTipo -> unTipo
identidad unParametro = unParametro

constante :: unTipo -> otroTipo -> unTipo
constante unaCosa otraCosa = unaCosa






precioTotal :: Float -> Float -> Float -> Float -> Float
precioTotal precioUnitario cantidad descuento costoDeEnvio =
  aplicarDescuento precioUnitario descuento * cantidad + costoDeEnvio

aplicarDescuento :: Float -> Float -> Float
aplicarDescuento unPrecio unDescuento = unPrecio * (1 - unDescuento)

esProductoDeElite :: String -> Bool
esProductoDeElite unProducto =
  esProductoDeLujo unProducto && esProductoCodiciado unProducto && not (esProductoCorriente unProducto)

esProductoDeLujo :: String -> Bool
esProductoDeLujo unProducto = elem 'x' unProducto || elem 'z' unProducto

esProductoCodiciado :: String -> Bool
esProductoCodiciado unProducto = length unProducto >= 10

esProductoCorriente :: String -> Bool
esProductoCorriente = undefined
-- Top-down