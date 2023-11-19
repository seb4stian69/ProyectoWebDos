<?php

include_once '../Common/Database.controller.php';

class Register extends Database{

    public function register($id, $primerNombre, $segundoNombre, $primerApellido, $segundoApellido, $celular, $direcion, $correo, $rol, $usuario, $contrasena){
        return $this->select(
            "call chanoclothes.CrearUsuarioRolCredencial(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);",
            [[
                $id,
                $primerNombre,
                $segundoNombre,
                $primerApellido,
                $segundoApellido,
                $celular,
                $direcion,
                $correo,
                $rol,
                $usuario,
                $contrasena
            ]]
        );
    }

}
;
?>