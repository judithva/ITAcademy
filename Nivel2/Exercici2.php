<?php
// Exercici 2
//La duración se ha de indicar en segundos
function precioLlamada(int $duracion) {
    echo "Tiempo " . $duracion . " segundos\n";
    //Coste de una llamada menor de 3 minutos
    $coste = 10;

    if ($duracion > 180) {
        //Decrementamos un segundo para mantener la tarifa hasta el incremento del minuto
        //240seg = 0.15€
        //241seg = 0.20€
        $duracion--;

        echo "Tiempo excedido en minutos " . (($duracion - 180)/60) . "\n";
        //Tiempo Excedido en minutos, redondeado a la baja
        $tiempoExcedido = floor(($duracion - 180)/60) + 1;
        echo "Paso excedido en " . $tiempoExcedido . "\n";

        $coste += $tiempoExcedido * 5;

    }
    echo "El precio de la llamada es: " . $coste . " por una duración de " . $duracion . " minutos \n";
}

precioLlamada(361);
