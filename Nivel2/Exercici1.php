<?php
// Exercici 1
function juegosOlimpicos(): void {
    for($i=1960; $i<=2016; $i+=4){
        echo "Año Olímpico:". $i ."\n";
    }
}

echo juegosOlimpicos();