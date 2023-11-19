<?php

include_once '../Common/Database.controller.php';

class Carrito extends Database{

    public function obtener($usuarioID){
        return $this->select(
            "call chanoclothes.ObtenerProductosCarritoUser(?);",
            [[
                $usuarioID
            ]]
        );
    }

    public function agregar($productoID, $userID, $cantidad){
        return $this->select(
            "call chanoclothes.AgregarAlCarrito(?, ?, ?);",
            [[
                $productoID,
                $userID,
                $cantidad
            ]]
        );
    }

    public function eliminar($carritoID){
        return $this->executeStatement(
            "DELETE FROM CarritoCompras WHERE _id = ?;",
            [[
                $carritoID
            ]]
        );
    }

}
;
?>