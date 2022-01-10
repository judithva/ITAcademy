<?php


class Dau implements PokerDice
{
    private array $side;
    private int $value;

    public function __construct()
    {
        $this->side = ['As', 'K', 'Q', 'J', '7', '8'];
        $this->value = -1;
    }

    public function throw()
    {
        $this->value =  mt_rand(0,5);
    }

    public function shapeName()
    {
        if ($this->value == -1)
            return "nulo";

        return $this->side[$this->value];
    }
}