<?php
//Exercici 3
function xocolata($numXoco) {
    return $numXoco * 1;
}

function xiclets($numXicle) {
    return $numXicle * 0.50;
}

function carmels($numCarmels) {
    return $numCarmels * 1.50;
}

function calculoCompra($numXoco, $numXicle, $numCarmels) {
    echo "Nº Xocolates: ". $numXoco.    " > Precio = ". xocolata($numXoco)  . "\n";
    echo "Nº Xicles: "   . $numXicle.   " > Precio = ". xiclets($numXicle)  . "\n";
    echo "Nº Carmels: "  . $numCarmels. " > Precio = ". carmels($numCarmels). "\n";

    Echo "Total " . (xocolata($numXoco) +  xiclets($numXicle) + carmels($numCarmels)) . "\n";
}


calculoCompra(2,1,1);