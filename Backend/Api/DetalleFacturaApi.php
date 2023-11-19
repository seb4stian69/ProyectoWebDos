<?php

include_once '../Controller/DetalleFacturaCrudController.php'; 

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

$controller = new DetalleFacturaCrud();
$okStatus = "HTTP/1.1 200 OK";

if ($_SERVER['REQUEST_METHOD'] === 'GET') {

    header('Content-Type: application/json');
    echo json_encode($controller->get());

}
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $json_data = file_get_contents("php://input");
    $data = json_decode($json_data);

    $_id = $data->_id;
    $cantidad = $data->cantidad;
    $precio = $data->precio;
    $subtotal = $data->subtotal;
    $Facturas__id = $data->Facturas__id;
    $Productos__id = $data->Productos__id;

    header('Content-Type: application/json');
    echo json_encode($controller->post($_id, $cantidad, $precio, $subtotal, $Facturas__id, $Productos__id));

}
if ($_SERVER['REQUEST_METHOD'] === 'PUT') {

    $json_data = file_get_contents("php://input");
    $data = json_decode($json_data);
    
    $_id = $data->_id;
    $cantidad = $data->cantidad;
    $precio = $data->precio;
    $subtotal = $data->subtotal;
    $Facturas__id = $data->Facturas__id;
    $Productos__id = $data->Productos__id;

    header('Content-Type: application/json');
    echo json_encode($controller->put($_id, $cantidad, $precio, $subtotal, $Facturas__id, $Productos__id));

}
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {

    $json_data = file_get_contents("php://input");
    $data = json_decode($json_data);
    
    $_id = $data->_id;

    header('Content-Type: application/json');
    echo json_encode($controller->delete($_id));

}

?>