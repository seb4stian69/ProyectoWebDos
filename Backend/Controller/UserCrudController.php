<?php

include_once '../Common/Database.controller.php';

class UserCrud extends Database{

    public function get(){
        return $this->selectNoParams(
            "call chanoclothes.Usuarios_CRUD('READ', '', '', '', '', '', '', '', '');"
        );
    }

    public function post($_id, $primer_nombre, $segundo_nombre, $primer_apellido, $segundo_apellido, $telefono, $direccion, $correo){
        return $this->executeStatement(
            "call chanoclothes.Usuarios_CRUD('CREATE', ?, ?, ?, ?, ?, ?, ?, ?);",
            [[
                $_id, $primer_nombre, $segundo_nombre, $primer_apellido, $segundo_apellido, $telefono, $direccion, $correo
            ]]
        );
    }

    public function put($_id, $primer_nombre, $segundo_nombre, $primer_apellido, $segundo_apellido, $telefono, $direccion, $correo){
        return $this->executeStatement(
            "call chanoclothes.Usuarios_CRUD('UPDATE', ?, ?, ?, ?, ?, ?, ?, ?);",
            [[
                $_id, $primer_nombre, $segundo_nombre, $primer_apellido, $segundo_apellido, $telefono, $direccion, $correo
            ]]
        );
    }

    public function delete($_id){
        return $this->executeStatement(
            "call chanoclothes.Usuarios_CRUD('DELETE', ?, '', '', '', '', '', '', '');",
            [[
                $_id
            ]]
        );
    }

}
;
?>