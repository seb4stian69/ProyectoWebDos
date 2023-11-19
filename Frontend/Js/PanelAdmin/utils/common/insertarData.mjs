import { crear } from "../crud/crudGeneral.mjs";
import { crearInput } from "./crearinputs.mjs";
import { eliminarDatosObservados } from "./eliminarData.mjs";
import { obtenerValores } from "./obtenerValoresInputs.mjs";
import { inicializarTabla } from "./creartabla.mjs"

const urlGeneral = "http://localhost/php-html/ProyectoFinal/Backend/Api"

export function insertarData(data){

    eliminarDatosObservados();

    var titulos = Object.keys(data[0]);

    titulos.forEach(titulo=>{
        crearInput(titulo, "text", titulo);
    })

    var contenedorElementos = document.getElementById("inputs");
    var botonAgregar = document.createElement("button");
    botonAgregar.textContent = "Agregar";
    contenedorElementos.appendChild(botonAgregar);

    botonAgregar.addEventListener('click', (e)=>{
        
        const data = obtenerValores();
        const tabla = sessionStorage.getItem("table")

        switch(tabla){

            case "Usuarios":
                crear(`${urlGeneral}/UserCrudApi.php`, data)
            break;
    
            case "Roles":
                crear(`${urlGeneral}/RolesCrudApi.php`, data)
            break;
    
            case "Credenciales":
                crear(`${urlGeneral}/CredencialesCrudApi.php`, data)
            break;
    
            case "Factura":
                crear(`${urlGeneral}/FacturaCrudApi.php`, data)
            break;
    
            case "MetodoPago":
                crear(`${urlGeneral}/MetodoPagoApi.php`, data)
            break;
    
            case "DetalleFactura":
                crear(`${urlGeneral}/DetalleFacturaApi.php`, data)
            break;
    
            case "Producto":
                crear(`${urlGeneral}/ProductoCrudApi.php`, data)
            break;
    
        }
    
    })

    inicializarTabla(titulos, data);

}

