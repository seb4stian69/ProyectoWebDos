<?php

include_once '../Common/Database.controller.php';

class MetodoPagoCrud extends Database{

    public function get(){
        return $this->selectNoParams(
            "call chanoclothes.MetodoPagoCompra_CRUD('READ', '', 'TDebito', '');"
        );
    }

    public function post($p_id, $p_medio, $p_detalles){
        return $this->executeStatement(
            "call chanoclothes.MetodoPagoCompra_CRUD('CREATE', ?, ?, ?);",
            [[
                $p_id, $p_medio, $p_detalles
            ]]
        );
    }

    public function put($p_id, $p_medio, $p_detalles){
        return $this->executeStatement(
            "call chanoclothes.MetodoPagoCompra_CRUD('UPDATE', ?, ?, ?);",
            [[
                $p_id, $p_medio, $p_detalles
            ]]
        );
    }

    public function delete($_id){
        return $this->executeStatement(
            "call chanoclothes.MetodoPagoCompra_CRUD('DELETE', ?, 'TDebito', '');",
            [[
                $_id
            ]]
        );
    }

}
;
?>