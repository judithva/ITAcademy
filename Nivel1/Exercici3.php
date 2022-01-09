<?php
// Exercici 3
// Parametrizamos la función
function escondite($number) {
    for($i=1; $i<= $number; $i+=2) {
        echo $i . "\n";
    }
}

escondite(10);