<?php
// Exercici 1
function esPar($number) {
    return (($number % 2) == 0) ? "El número " . $number . " es par\n" :  "El número " . $number . " es impar\n";
}

echo esPar(11);