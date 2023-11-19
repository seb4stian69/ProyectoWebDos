<?php

include_once '../Common/Database.controller.php';

class RelizarCompra extends Database{

    public function obtenerValorVenta($idProduct){
        return $this->select(
            "call chanoclothes.ObtenerGananciaProducto(?);",
            [[
                $idProduct
            ]]
        );
    }

    public function crearFactura($idFactura, $fecha, $userID, $metodoPagoID){
        return $this->executeStatement(
            "call chanoclothes.CrearFactura(?, ?, ?, ?);",
            [[
                $idFactura,
                $fecha,
                $userID,
                $metodoPagoID
            ]]
        );
    }

    public function crearDetalleFactura($idDetalle, $cantidad, $precio, $subtotal, $facturaID, $productoID){
        return $this->executeStatement(
            "call chanoclothes.CrearDetalleFactura(?, ?, ?, ?, ?, ?);",
            [[
                $idDetalle,
                $cantidad,
                $precio,
                $subtotal,
                $facturaID,
                $productoID
            ]]
        );
    }

}
;
?>

