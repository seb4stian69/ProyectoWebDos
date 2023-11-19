<?php

include_once '../Common/Database.controller.php';

class Gerente extends Database{  

    public function obtenerProductosVendidosPorMes($anio, $mes){
        return $this->select(
            "call ChanoClothes.ObtenerProductosVendidosPorMes(?, ?);",
            [[
                $anio,
                $mes
            ]]
        );
    }

    public function obtenerGananciasPorAnioMes($anio, $mes){
        return $this->select(
            "call ChanoClothes.ObtenerGananciasPorAnioMes(?, ?);",
            [[
                $anio,
                $mes
            ]]
        );
    }

}
;
?>