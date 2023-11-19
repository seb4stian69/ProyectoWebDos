<?php

include_once '../Common/Database.controller.php';

class ProductoCrud extends Database{

    public function get(){
        return $this->selectNoParams(
            "call chanoclothes.Productos_CRUD('READ', '', 0, '', '', 0, 0, 0, '');"
        );
    }

    public function post($p_id, $p_precio, $p_nombre, $p_descripcion, $p_stock, $p_valor_compra, $p_valor_venta, $p_imagen){
        return $this->executeStatement(
            "call chanoclothes.Productos_CRUD('CREATE', ?, ?, ?, ?, ?, ?, ?, ?);",
            [[
                $p_id, $p_precio, $p_nombre, $p_descripcion, $p_stock, $p_valor_compra, $p_valor_venta, $p_imagen
            ]]
        );
    }

    public function put($p_id, $p_precio, $p_nombre, $p_descripcion, $p_stock, $p_valor_compra, $p_valor_venta, $p_imagen){
        return $this->executeStatement(
            "call chanoclothes.Productos_CRUD('UPDATE', ?, ?, ?, ?, ?, ?, ?, ?);",
            [[
                $p_id, $p_precio, $p_nombre, $p_descripcion, $p_stock, $p_valor_compra, $p_valor_venta, $p_imagen
            ]]
        );
    }

    public function delete($_id){
        return $this->executeStatement(
            "call chanoclothes.Productos_CRUD('DELETE', ?, 0, '', '', 0, 0, 0, '');",
            [[
                $_id
            ]]
        );
    }

}
;
?>