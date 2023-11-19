import { actualizar, eliminar } from "../crud/crudGeneral.mjs";

let titulosG = []
const urlGeneral = "http://localhost/php-html/ProyectoFinal/Backend/Api"

function agregarEncabezado(titulos) {

  var encabezado = document.getElementById("encabezadoTabla");
  var filaEncabezado = document.createElement("tr");

  titulos.push("Editar")
  titulos.push("Eliminar")

  titulosG = titulos

  for (var i = 0; i < titulos.length; i++) {
    var th = document.createElement("th");
    th.textContent = titulos[i];
    filaEncabezado.appendChild(th);
  }

  encabezado.appendChild(filaEncabezado);

}

function agregarFila(elemento) {
  
  var tabla = document.getElementById("cuerpoTabla");
  var fila = document.createElement("tr");

  var claves = Object.keys(elemento);

  for (var i = 0; i < claves.length; i++) {
    var celda = document.createElement("td");
    var valor = elemento[claves[i]] || '';
    celda.innerHTML = `<input class='inputData' style="width:150px; border:none;" type="text" value="${valor}">`;
    fila.appendChild(celda);
  }

  var celdaEditar = document.createElement("td");
  var botonEditar = document.createElement("button");
  botonEditar.textContent = "Editar";

  botonEditar.addEventListener("click", function() {
  
    var object = {};
    var rows = this.parentNode.parentNode; 

    for (let index = 0; index < rows.cells.length - 2; index++) {
      object[titulosG[index]] = rows.cells[index].querySelector('input').value;
    }

    const tabla = sessionStorage.getItem("table")

    switch(tabla){

      case "Usuarios":
        actualizar(`${urlGeneral}/UserCrudApi.php`, object)
      break;

      case "Roles":
        actualizar(`${urlGeneral}/RolesCrudApi.php`, object)
      break;

      case "Credenciales":
        actualizar(`${urlGeneral}/CredencialesCrudApi.php`, object)
      break;

      case "Factura":
        actualizar(`${urlGeneral}/FacturaCrudApi.php`, object)
      break;

      case "MetodoPago":
        actualizar(`${urlGeneral}/MetodoPagoApi.php`, object)
      break;

      case "DetalleFactura":
        actualizar(`${urlGeneral}/DetalleFacturaApi.php`, object)
      break;

      case "Producto":
        actualizar(`${urlGeneral}/ProductoCrudApi.php`, object)
      break;

    }

  });
  
  celdaEditar.appendChild(botonEditar);
  fila.appendChild(celdaEditar);

  var celdaEliminar = document.createElement("td");
  var botonEliminar = document.createElement("button");
  botonEliminar.textContent = "Eliminar";

  botonEliminar.addEventListener("click", function() {
  
    var rows = this.parentNode.parentNode; 
    var id = rows.cells[0].querySelector('input').value;

    const tabla = sessionStorage.getItem("table")

    switch(tabla){

      case "Usuarios":
        eliminar(`${urlGeneral}/UserCrudApi.php`, id)
      break;

      case "Roles":
        eliminar(`${urlGeneral}/RolesCrudApi.php`, id)
      break;

      case "Credenciales":
        eliminar(`${urlGeneral}/CredencialesCrudApi.php`, id)
      break;

      case "Factura":
        eliminar(`${urlGeneral}/FacturaCrudApi.php`, id)
      break;

      case "MetodoPago":
        eliminar(`${urlGeneral}/MetodoPagoApi.php`, id)
      break;

      case "DetalleFactura":
        eliminar(`${urlGeneral}/DetalleFacturaApi.php`, id)
      break;

      case "Producto":
        eliminar(`${urlGeneral}/ProductoCrudApi.php`, id)
      break;

    }

    rows.remove();

  });

  celdaEliminar.appendChild(botonEliminar);
  fila.appendChild(celdaEliminar);
  tabla.appendChild(fila);

}

export function inicializarTabla(titulos, elementos) {

  agregarEncabezado(titulos);

  elementos.forEach(element => {  
    agregarFila(element);
  });

}