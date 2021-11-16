<?php
/******************** PHP Bàsics Tema 3 *******************/
/******************** Nivel 2 *******************/

// Exercici 1
// Cálculo de la suma de dos valores enteros
function suma(int $x, int $y): int {
    if($x==$y){
        return ($x+$y)*2;
    }

    return $x+$y;
}

echo suma(3,2) . '<br>';

// Exercici 2
// Intercambiar el primer y último caracter de una cadena
function invers(string $texto): string {
    return strrev($texto);
}

echo invers('wxyz') . '<br>';
echo invers('a')    . '<br>';
echo invers('ab')   . '<br>';


