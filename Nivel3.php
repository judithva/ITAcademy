<?php
/******************** PHP Bàsics Tema 3 *******************/
/******************** Nivel 3 *******************/

// Exercici 1
function convertToStringToArray(string $texto): void {
    // Eliminamos espacios en blanco de la cadena
    $cadena = str_replace(' ', '', $texto);

    $acumulador=[];
    // Recorremos la cadena de texto sin espacios
    for($i=0; $i < strlen($cadena); $i++) {
        array_push($acumulador, $cadena[$i]);
    }
    var_dump($acumulador);
}

echo convertToStringToArray('Hello world');

// Exercici 2
// Contador de valores en un array
function contador(array $valors): array {
    return array_count_values($valors);
}

var_dump(contador([1, "hello", 1, "world", "hello"]));
