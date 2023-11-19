<?php

include_once '../Controller/CarritoComprasController.php';

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

$controller = new Carrito();
$okStatus = "HTTP/1.1 200 OK";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $json_data = file_get_contents("php://input");
    $data = json_decode($json_data);

    $option = $data->option;

    if($option == "O"){
        $json_data = file_get_contents("php://input");
        $data = json_decode($json_data);
        
        $usuarioID = $data->userID;
    
        header('Content-Type: application/json');
        echo json_encode($controller->obtener($usuarioID));
    }else{
        $productoID = $data->productoID;
        $userID = $data->userID;
        $cantidad = $data->cantidad;
    
        header('Content-Type: application/json');
        echo json_encode($controller->agregar($productoID, $userID, $cantidad));
    }
    
}

if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    
    $json_data = file_get_contents("php://input");
    $data = json_decode($json_data);
    
    $carritoID = $data->carritoID;

    header('Content-Type: application/json');
    echo json_encode($controller->eliminar($carritoID));

}

?>