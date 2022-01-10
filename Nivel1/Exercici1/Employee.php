<?php


class Employee
{
    private string $name;
    private int $salary;

    public function initialize(string $nameEmployee, int $salaryEmployee)
    {
        $this->name = $nameEmployee;
        $this->salary = $salaryEmployee;
    }

    public function printer()
    {
        $this->esPagaImpostos($this->salary) ? $message = "ha de pagar impuestos\n" : $message = "no ha de pagar impuestos\n";

        echo $this->name . " " . $message;
    }

    public function esPagaImpostos(int $salary): bool
    {
        return  ($salary > 6000) ? true : false;
    }
}