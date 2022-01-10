<?php


class Rectangle extends Shape
{
    public function area()
    {
        $area = $this->getWidth() * $this->getHeight();
        echo "El área del rectángulo es " . $area ."\n";
    }
}