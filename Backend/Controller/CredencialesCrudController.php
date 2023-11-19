<?php

include_once '../Common/Database.controller.php';

class CredencialesCrud extends Database{

    public function get(){
        return $this->selectNoParams(
            "call chanoclothes.Credenciales_CRUD('READ', '', '', '', '');"
        );
    }

    public function post($p_id, $p_usuario, $p_contrasena, $p_usuarios_id){
        return $this->executeStatement(
            "call chanoclothes.Credenciales_CRUD('CREATE', ?, ?, ?, ?);",
            [[
                $p_id, $p_usuario, $p_contrasena, $p_usuarios_id
            ]]
        );
    }

    public function put($p_id, $p_usuario, $p_contrasena, $p_usuarios_id){
        return $this->executeStatement(
            "call chanoclothes.Credenciales_CRUD('UPDATE', ?, ?, ?, ?);",
            [[
                $p_id, $p_usuario, $p_contrasena, $p_usuarios_id
            ]]
        );
    }

    public function delete($_id){
        return $this->executeStatement(
            "call chanoclothes.Credenciales_CRUD('DELETE', ?, '', '', '');",
            [[
                $_id
            ]]
        );
    }

}
;
?>