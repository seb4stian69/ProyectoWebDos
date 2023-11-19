<?php

include_once '../Common/Database.controller.php';

class FacturaCrud extends Database{

    public function get(){
        return $this->selectNoParams(
            "call chanoclothes.Facturas_CRUD('READ', '', CURDATE(), 'EnProceso', '', '');"
        );
    }

    public function post($p_id, $p_estado, $p_usuarios_id, $p_metodo_pago_id, ){
        return $this->executeStatement(
            "call chanoclothes.Facturas_CRUD('CREATE', ?, CURDATE(), ?, ?, ?);",
            [[
                $p_id, $p_estado, $p_usuarios_id, $p_metodo_pago_id, 
            ]]
        );
    }

    public function put($p_id, $p_estado, $p_usuarios_id, $p_metodo_pago_id, ){
        return $this->executeStatement(
            "call chanoclothes.Facturas_CRUD('UPDATE', ?, CURDATE(), ?, ?, ?);",
            [[
                $p_id, $p_estado, $p_usuarios_id, $p_metodo_pago_id, 
            ]]
        );
    }

    public function delete($_id){
        return $this->executeStatement(
            "call chanoclothes.Facturas_CRUD('DELETE', ?, CURDATE(), 'EnProceso', '', '');",
            [[
                $_id
            ]]
        );
    }

}
;
?>