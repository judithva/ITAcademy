<?php


class Triangle extends Shape
{
    public function area()
    {
        $area = ($this->getHeight() * $this->getWidth()) / 2;
        echo "El área del triángulo es " . $area . "\n";
    }
}