<?php

include_once '../Controller/ServiceClientController.php';
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

if($method == "OPTIONS"){die();}

$controller = new ServiceClient();
$okStatus = "HTTP/1.1 200 OK";

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

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    
    header('Content-Type: application/json');
    echo json_encode($controller->selectAll());

}
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    $json_data = file_get_contents("php://input");
    $data = json_decode($json_data);

    $id = generarID();
    $log = $data->log;
    $fechaDatetime = new DateTime();
    $fechaStr = $fechaDatetime->format('Y-m-d H:i:s');
    $usuarioID = $data->usuarioID;

    header('Content-Type: application/json');
    $controller->addToPqrs($id, $log, $fechaStr, $usuarioID);
    echo json_encode(array("Mensaje" => "Pqrs agregado correctamente"));

}

?>