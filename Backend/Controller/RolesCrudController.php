<?php

include_once '../Common/Database.controller.php';

class RolCrud extends Database{

    public function get(){
        return $this->selectNoParams(
            "call chanoclothes.Roles_CRUD('READ', '', 'cliente', '');"
        );
    }

    public function post($p_id, $p_tipo, $p_usuarios_id ){
        return $this->executeStatement(
            "call chanoclothes.Roles_CRUD('CREATE', ?, ?, ?);",
            [[
                $p_id, $p_tipo, $p_usuarios_id 
            ]]
        );
    }

    public function put($p_id, $p_tipo, $p_usuarios_id ){
        return $this->executeStatement(
            "call chanoclothes.Roles_CRUD('UPDATE', ?, ?, ?);",
            [[
                $p_id, $p_tipo, $p_usuarios_id 
            ]]
        );
    }

    public function delete($_id){
        return $this->executeStatement(
            "call chanoclothes.Roles_CRUD('DELETE', ?, 'cliente', '');",
            [[
                $_id
            ]]
        );
    }

}
;
?>