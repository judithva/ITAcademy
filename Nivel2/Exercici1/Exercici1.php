<?php

include "PokerDice.php";
include "Dau.php";


function getTotalThrows($joc)
{
    return sizeof($joc);
}

if ($argc == 2) {
    $numTirada = $argv[1];

    $d1 = new Dau();
    $d2 = new Dau();
    $d3 = new Dau();
    $d4 = new Dau();
    $d5 = new Dau();
    $juego = [];

    do {
        $tirada = [$d1, $d2, $d3, $d4, $d5];

        foreach ($tirada as $item)
        {
            $item->throw();
            $side = $item->shapeName();
            echo $side . "\n";
        }

        $juego [] = $tirada;
        $numTirada--;
    } while($numTirada > 0);

    echo "Nº total de tiradas: " . getTotalThrows($juego) . "\n";
} else {
    echo "Ha de indicar el número de tiradas a jugar \n";
}





