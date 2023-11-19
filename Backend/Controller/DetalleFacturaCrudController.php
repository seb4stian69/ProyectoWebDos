<?php

include_once '../Common/Database.controller.php';

class DetalleFacturaCrud extends Database{

    public function get(){
        return $this->selectNoParams(
            "call chanoclothes.DetallesFactura_CRUD('READ', '', 0, 0, 0, '', '');"
        );
    }

    public function post($p_id, $p_cantidad, $p_precio, $p_subtotal, $p_facturas_id, $p_productos_id){
        return $this->executeStatement(
            "call chanoclothes.DetallesFactura_CRUD('CREATE', ?, ?, ?, ?, ?, ?);",
            [[
                $p_id, $p_cantidad, $p_precio, $p_subtotal, $p_facturas_id, $p_productos_id
            ]]
        );
    }

    public function put($p_id, $p_cantidad, $p_precio, $p_subtotal, $p_facturas_id, $p_productos_id){
        return $this->executeStatement(
            "call chanoclothes.DetallesFactura_CRUD('UPDATE', ?, ?, ?, ?, ?, ?);",
            [[
                $p_id, $p_cantidad, $p_precio, $p_subtotal, $p_facturas_id, $p_productos_id
            ]]
        );
    }

    public function delete($_id){
        return $this->executeStatement(
            "call chanoclothes.DetallesFactura_CRUD('DELETE', ?, 0, 0, 0, '', '');",
            [[
                $_id
            ]]
        );
    }

}
;
?>