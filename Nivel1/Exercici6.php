<?php
// Exercici 6
function isBitten() {
    $bitten = ((mt_rand(1,2)*50) == 50) ? 'TRUE' : 'FALSE';
    echo $bitten . "\n";
}

isBitten();
