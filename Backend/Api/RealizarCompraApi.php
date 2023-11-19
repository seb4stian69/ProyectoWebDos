<?php

include_once '../Controller/CarritoComprasController.php';
include_once '../Controller/RealizarCompraController.php';
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

$controllerCarrito = new Carrito();
$controllerRealizarCompra = new RelizarCompra();
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

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $json_data = file_get_contents("php://input");
    $data = json_decode($json_data);
    $usuarioID = $data->userID;
    $datosCarrito = $controllerCarrito->obtener($usuarioID);
    $resultadoCarrito = array( 'data' => $datosCarrito );

    header('Content-Type: application/json');
    if(!empty($resultadoCarrito['data'])){

        $idMain = generarID();
        $idFactura = 'FACT-'.$idMain;
        $metodoPagoID = $data->metodoPagoID;;
        $fecha = date('Y-m-d');

        $controllerRealizarCompra->crearFactura($idFactura, $fecha, $usuarioID, $metodoPagoID);

        foreach ($resultadoCarrito['data'] as $itemCarrito) {
        
            $idDetalle = 'DET-'.generarID();

            $idItemCarrito = $itemCarrito['_id'];
            $productID = $itemCarrito['Productos__id'];
            $cantidad = $itemCarrito['cantidad'];

            $datosValorVenta = $controllerRealizarCompra->obtenerValorVenta($productID);
            $valorVenta = $datosValorVenta[0]['valor_venta'];
            $resultadoValorVenta = array('data' => array('valor_venta' => $valorVenta));
            $precio = $resultadoValorVenta['data']['valor_venta'];
            $subtotal = $precio * $cantidad;

            $controllerRealizarCompra->crearDetalleFactura($idDetalle, $cantidad, $precio, $subtotal, $idFactura, $productID);
            $controllerCarrito->eliminar($idItemCarrito);
            
        }

        echo json_encode(array("Mensaje" => "Compra realizada con exito"));

    }else{
        echo json_encode(array("Mensaje" => "No hay elementos para realizar la compra"));
    }

}


?>