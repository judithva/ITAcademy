<?php
// Exercici 5
function calculaGrado($nota) {
    $message = '';
    $nota = $nota/100;

    if($nota >= 0.6) {
        $message = "Estás en Primera División\n";
    } elseif ($nota >= 0.45 && $nota <= 0.59 ) {
        $message = "Estás en Segunda Divisió\n";
    } elseif ($nota >= 0.33 && $nota <= 0.44 ) {
        $message = "Estás en Tercera Divisió\n";
    } else {
        $message = "Estás Suspendido\n";
    }

    return $message;
}

echo calculaGrado(73);
