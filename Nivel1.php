<?php
/******************** PHP Bàsics Tema 3 *******************/
/******************** Nivel 1 *******************/

// Exercici 1
// Definimos variables asignándoles un valor
$myNumber = 5;              // Integer
$myDouble = 125.45;         // Double
$myString = 'Hello World';  // String
$myBoolean = true;          // Boolean
// Imprimimos por pantalla
echo 'Integer:' . $myNumber . '<br>';
echo 'Double:'  . $myDouble . '<br>';
echo 'String:'  . $myString . '<br>';
echo 'Boolean:' . $myBoolean. '<br>';


// Exercici 2
// De la variable definida en el exe1 anterior $myString utilizamos las funciones de string
echo 'Convertimos a mayúsculas:'. strtoupper($myString) . '<br>';
echo 'Longitud:' .  strlen($myString) . '<br>';
echo 'Orden inverso:' .  strrev($myString) . '<br>';

$txt = ' Aquest és el curs de PHP';
echo $myString . $txt . '<br>';


// Exercici 3
// Definición de una constante
define("MYNAME", "Judith");
echo '<h1><b>'. MYNAME . '</b></h1><br>';


// Exercici 4
// Definición de variables para realizar operaciones matemáticas
$x = 5;
$y = 3;

echo 'Mis variables tienen el valor de:' . $x . ' y ' . $y . '<br>';
echo 'Suma:' . ($x + $y) . '<br>';
echo 'Resta:' . ($x - $y) . '<br>';
echo 'Producto:' . ($x * $y) . '<br>';
echo 'Modulo:' . ($x % $y) . '<br>';


$n = 10.5;
$m = 3.14;

echo 'Mis variables tienen el valor de:' . $x . ', ' . $y . ', ' . $n .' y ' . $m .'<br>';
echo 'Doble de todas las variables :' . ($x * 2) . ', ' . ($y *2) . ', ' . ($n*2). ' y ' .($m*2) . '<br>';
echo 'Suma de todas las variables  :' . ($x + $y + $n + $m) . '<br>';
echo 'Producto de todas las variables :' . ($x * $y * $n * $m) . '<br>';


// Exercici 5
// Definición de arrays
$myA = [1,2,3,4,5];
$myB = [9,8,7];

array_push($myB,6);
print_r($myB);
echo '<br>';

$mergeArray = array_merge($myA, $myB);
print_r('El array resultante es de:' . count($mergeArray) . '<br>');
print_r($mergeArray);
