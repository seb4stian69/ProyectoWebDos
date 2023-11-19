
let qty = 0;

const obtenerProductosCarrito = () =>{

    const apiUrl = "http://localhost/php-html/ProyectoFinal/Backend/Api/CarritoComprasApi.php";

    const requestData = {
        userID: sessionStorage.getItem("UserID"),
        option: "O"
    };

    const requestOptions = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(requestData)
    };

    fetch(apiUrl, requestOptions)
    .then(response => response.json())
    .then(data => {
        
        
        qty = data.length
        data.forEach(cartProduct => {
            crearElementoClotheCard(cartProduct);   
        });

    })
    .catch(error => {
        console.error('Error en la solicitud:', error);
    });

}

const eliminarProductosCarrito = (id) =>{

    const apiUrl = "http://localhost/php-html/ProyectoFinal/Backend/Api/CarritoComprasApi.php";

    const requestData = {
        carritoID: id
    };

    const requestOptions = {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(requestData)
    };

    fetch(apiUrl, requestOptions)
    .then(response => response.json())
    .then(data => {

        

        var contenedor = document.getElementById("allClothes");

        // Elimina todos los elementos hijos del contenedor
        while (contenedor.firstChild) {
            contenedor.removeChild(contenedor.firstChild);
        }

        obtenerProductosCarrito()

    })
    .catch(error => {
        console.error('Error en la solicitud:', error);
    });

}

const realizarCompra = (metodoPago) =>{

    const apiUrl = "http://localhost/php-html/ProyectoFinal/Backend/Api/RealizarCompraApi.php";

    const requestData = {
        userID: sessionStorage.getItem("UserID"),
        metodoPagoID: metodoPago
    };

    const requestOptions = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(requestData)
    };

    fetch(apiUrl, requestOptions)
    .then(response => response.json())
    .then(data => {
        
        Swal.fire({
            position: "bottom-start",
            icon: "success",
            title: "Los productos del carrito han sido comprados con exito!",
            showConfirmButton: false,
            timer: 1500
        });

        var contenedor = document.getElementById("allClothes");

        // Elimina todos los elementos hijos del contenedor
        while (contenedor.firstChild) {
            contenedor.removeChild(contenedor.firstChild);
        }

        obtenerProductosCarrito()

    })
    .catch(error => {

        console.error('Error en la solicitud:', error);

        Swal.fire({
            title: 'Error!',
            text: 'Error al intentar comprar los productos del carrito!',
            icon: 'error',
            confirmButtonText: 'Ok'
        })

    });

}

const realizarCompraBtn = () =>{

    if(qty==0){

        Swal.fire({
            title: "No hay productos",
            text: "No tienes productos en tu carrito para comprar",
            icon: "question"
        });

    }else{

        Swal.fire({

            title: "Selecciona tu medio de pago",
            icon: "info",
            html: `
              <select id="options" class="swal2-input">
                <option value="1">Tarjeta de debito</option>
                <option value="2">Tarjeta de credito</option>
                <option value="3">Nequi</option>
              </select>
            `,
            showCloseButton: false,
            showCancelButton: true,
            focusConfirm: false,
            confirmButtonText: "Aceptar",
            confirmButtonAriaLabel: "Aceptar selección",
            allowOutsideClick: false,
            
          }).then((result) => {
    
            if (result.isConfirmed) {
              realizarCompra(document.getElementById('options').value)
            }
    
          });

    }

}

/* Manipulacion del DOM */

function crearElementoClotheCard(carProduct) {

    // Crear el contenedor principal
    var clotheCard = document.createElement("div");
    clotheCard.id = "clotheCard";

    // Crear la imagen
    var camisaVector = document.createElement("img");
    camisaVector.id = "camisaVector";
    camisaVector.src = "../../Resources/PanelClient/camisavector.png";
    camisaVector.alt = "";

    // Crear el círculo inferior izquierdo
    var bottomLeft = document.createElement("div");
    bottomLeft.className = "circle bottom-left";
    bottomLeft.setAttribute("onclick", "eliminarDiv(this)");

    // Crear el círculo superior derecho
    var topRight = document.createElement("div");
    topRight.className = "circle top-right";
    var numberProduct = document.createElement("p");
    numberProduct.innerText = carProduct.cantidad;
    topRight.appendChild(numberProduct);

    // Agregar todos los elementos al contenedor principal
    clotheCard.appendChild(camisaVector);
    clotheCard.appendChild(bottomLeft);
    clotheCard.appendChild(topRight);

    // Añadir el elemento al contenedor en el documento (ajusta el ID del contenedor según tu estructura HTML)
    var contenedor = document.getElementById("allClothes");
    contenedor.appendChild(clotheCard);

    /* Funcionalidad de cada boton */

    bottomLeft.addEventListener('click', e=>{

        Swal.fire({
            position: "bottom-start",
            icon: "success",
            title: "Eliminaste el producto del carrito",
            showConfirmButton: false,
            timer: 1500
        });

        eliminarProductosCarrito(carProduct._id)
    })


}

obtenerProductosCarrito()

