<?php

include "Shape.php";
include "Triangle.php";
include "Rectangle.php";

if($argc == 3) {
    $width = $argv[1];
    $heigth = $argv[2];
    $triangle = new Triangle($width, $heigth);
    $triangle->area();
    $rectangle = new Rectangle($width, $heigth);
    $rectangle->area();
} else {
    echo "Ha de indicar los parámetros de entrada: ancho y alto \n";
}