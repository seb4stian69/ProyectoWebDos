<?php

include_once '../Controller/RegisterController.php';
include_once '../Shared/AutoGenID.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);

header("Access-Control-Allow-Origin: http://127.0.0.1:5500");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: text/html; charset=utf-8");
header("P3P: CP=\"IDC DSP COR CURa ADMa OUR IND PHY ONL COM STA\"");
$method = $_SERVER['REQUEST_METHOD'];

function randomKey(): string {
    $fechaActualEnMilisegundos = round(microtime(true) * 1000);
    $fechaActualEnNanosegundos = gmp_mul($fechaActualEnMilisegundos, 1000000);
    return strval($fechaActualEnNanosegundos);
}

function generarID(): string {

    $salt = GenerarRandomHash::generateSalt();

    try {
        $hashed = GenerarRandomHash::generar(randomKey(), $salt);
        return GenerarRandomHash::bytesToHex(hex2bin($hashed));
    } catch (Exception $error) {
        echo 'Error al generar el ID: ' . $error->getMessage();
    }

}

if($method == "OPTIONS"){die();}

$controller = new Register();
$okStatus = "HTTP/1.1 200 OK";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    $json_data = file_get_contents("php://input");
    $data = json_decode($json_data);
    
    $autogen = generarID();
    $id = substr($autogen, 0, 15);
    $primerNombre = $data->primerNombre;
    $segundoNombre = $data->segundoNombre;
    $primerApellido = $data->primerApellido;
    $segundoApellido = $data->segundoApellido;
    $celular = $data->celular;
    $direcion = $data->direcion;
    $correo = $data->correo;
    $rol = $data->rol;
    $usuario = $data->usuario;
    $contrasena = $data->contrasena;

    header('Content-Type: application/json');
    echo json_encode($controller->register(
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
    ));

}

?>