<?php


abstract class Shape
{
    private int $width;
    private int $height;

    public function __construct(int $widthI, int $heightI)
    {
        $this->width = $widthI;
        $this->height = $heightI;
    }

    /**
     * @return int
     */
    public function getHeight(): int
    {
        return $this->height;
    }

    /**
     * @return int
     */
    public function getWidth(): int
    {
        return $this->width;
    }

    public abstract function area();
}