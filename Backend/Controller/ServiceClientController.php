<?php

include_once '../Common/Database.controller.php';

class ServiceClient extends Database{  

    public function selectAll(){
        return $this->selectNoParams(
            "SELECT * FROM chanoclothes.pqrsusuarios;");
    }
    public function addToPqrs($id, $log, $fecha, $usuarioID){
        return $this->executeStatement(
            "INSERT INTO chanoclothes.pqrsusuarios values (?, ?, ?, ?);",
        [[
            $id, $log, $fecha, $usuarioID
        ]]);
    }

}
;
?>