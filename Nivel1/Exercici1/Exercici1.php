<?php

include "Employee.php";

if($argc == 3) {
    $name = $argv[1];
    $salary  = $argv[2];
    $employee = new Employee();
    $employee->initialize($name, $salary);
    $employee->printer();
} else {
    echo "Ha de indicar los parámetros de entrada: nombre y salario \n";
}