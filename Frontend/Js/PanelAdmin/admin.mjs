
import { obtenerValores } from "./utils/common/obtenerValoresInputs.mjs";
import { obtener } from "./utils/crud/crudGeneral.mjs";

const urlGeneral = "http://localhost/php-html/ProyectoFinal/Backend/Api"

const obtenerElementos = ()=>{
    
    var seleccion = document.getElementById('seleccion');

    switch(seleccion.value){

        case "1":
            obtener(`${urlGeneral}/UserCrudApi.php`)
            sessionStorage.setItem("table", "Usuarios")
        break;

        case "2":
            obtener(`${urlGeneral}/RolesCrudApi.php`);
            sessionStorage.setItem("table", "Roles")
        break;

        case "3":
            obtener(`${urlGeneral}/CredencialesCrudApi.php`);
            sessionStorage.setItem("table", "Credenciales")
        break;

        case "4":
            obtener(`${urlGeneral}/FacturaCrudApi.php`);
            sessionStorage.setItem("table", "Factura")
        break;

        case "5":
            obtener(`${urlGeneral}/MetodoPagoApi.php`);
            sessionStorage.setItem("table", "MetodoPago")
        break;

        case "6":
            obtener(`${urlGeneral}/DetalleFacturaApi.php`);
            sessionStorage.setItem("table", "DetalleFactura")
        break;

        case "7":
            obtener(`${urlGeneral}/ProductoCrudApi.php`);
            sessionStorage.setItem("table", "Producto")
        break;

    }

}

document.getElementById("seleccion").addEventListener('change', (e)=>{
    obtenerValores()    
    obtenerElementos()
})

sessionStorage.setItem("table", "Usuarios")
obtenerElementos();