<?php

include_once '../Common/Database.controller.php';

class ObtenerQtyProductoCarrito extends Database{  

    public function obtener($id){
        return $this->select(
            "call chanoclothes.ObtenerCantidadProductosEnCarritoPorID(?);",
            [[
                $id
            ]]
        );
    }

}
;
?>