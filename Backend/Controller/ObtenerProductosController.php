<?php

include_once '../Common/Database.controller.php';

class ObtenerProductos extends Database{

    public function get(){
        return $this->selectNoParams(
            "SELECT * FROM chanoclothes.productos;"
        );
    }

}
;
?>