<?php
// Exercici 4
// Parámetro por defecto, inicializado a un valor
function escondite($number=10) {
    for($i=1; $i<= $number; $i+=2) {
        echo $i . "\n";
    }
}

escondite();
