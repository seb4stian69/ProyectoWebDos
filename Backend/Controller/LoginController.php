<?php

include_once '../Common/Database.controller.php';

class Sesion extends Database{  

    public function login($usuario, $contrasena){
        return $this->select(
            "call ChanoClothes.InicioSesion(?, ?);",
            [[
                $usuario,
                $contrasena
            ]]
        );
    }

}
;
?>