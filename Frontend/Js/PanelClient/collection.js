
document.getElementById("numberProduct").innerHTML = sessionStorage.getItem("qtyCart");

const realizarPeticion = () =>{

    const apiUrl = 'http://localhost/php-html/ProyectoFinal/Backend/Api/ObtenerProductosApi.php';

    const requestOptions = {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        }
    };

    fetch(apiUrl, requestOptions)
    .then(response => response.json())
    .then(data => {

        data.forEach(product=>{
            crearElementoClotheCard(product)
        })

    })
    .catch(error => {
        console.error('Error en la solicitud:', error);
    });


}

const obtenerProductosCarrito = () =>{

    const apiUrl = "http://localhost/php-html/ProyectoFinal/Backend/Api/ObtenerQtyProductoCarrito.php";

    const requestData = {
        id: sessionStorage.getItem("UserID")
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
        
        document.getElementById("numberProduct").innerHTML = data[0].total_registros

    })
    .catch(error => {
        console.error('Error en la solicitud:', error);
    });

}

const agregarProductoAlCarrito = (productoID, cantidad) =>{

    const apiUrl = "http://localhost/php-html/ProyectoFinal/Backend/Api/CarritoComprasApi.php";

    const requestData = {
        productoID: productoID,
        userID: sessionStorage.getItem("UserID"),
        cantidad: cantidad,
        option: "A"
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
        
        if(data[0].Mensaje == "Producto agregado o actualizado con éxito"){
            obtenerProductosCarrito()
            
            Swal.fire({
                position: "bottom-start",
                icon: "success",
                title: "Producto agregado o actualizado con éxito",
                showConfirmButton: false,
                timer: 1500
            });

        }else{
            
            Swal.fire({
                title: 'Error!',
                text: 'Error al intentar agregar productos al carrito!',
                icon: 'error',
                confirmButtonText: 'Ok'
            })

        }

    })
    .catch(error => {

        console.error('Error en la solicitud:', error);

        Swal.fire({
            title: 'Error!',
            text: 'Error al intentar agregar productos al carrito!',
            icon: 'error',
            confirmButtonText: 'Ok'
        })


    });

}

/* Manipulacion del DOM */

function crearElementoClotheCard(product) {

    // Crear el contenedor principal
    var clotheCard = document.createElement("div");
    clotheCard.id = "clotheCard";

    // Crear la imagen
    var camisaVector = document.createElement("img");
    camisaVector.id = "camisaVector";
    camisaVector.src = "../../Resources/PanelClient/camisavector.png";
    camisaVector.alt = "";

    // Crear los círculos
    var bottomLeft = document.createElement("div");
    bottomLeft.className = "circle bottom-left";

    var bottomRightOne = document.createElement("div");
    bottomRightOne.id = "plusProduct";
    bottomRightOne.className = "circle bottom-right-one";
    bottomRightOne.innerHTML = "<p>+</p>";

    var bottomRightTwo = document.createElement("div");
    bottomRightTwo.id = "lessProduct";
    bottomRightTwo.className = "circle bottom-right-two";
    bottomRightTwo.innerHTML = "<p>-</p>";

    var topRight = document.createElement("div");
    topRight.className = "circle top-right";
    var numberProduct = document.createElement("p");
    numberProduct.className = "numberProduct";
    numberProduct.innerText = "0";
    topRight.appendChild(numberProduct);

    // Agregar todos los elementos al contenedor principal
    clotheCard.appendChild(camisaVector);
    clotheCard.appendChild(bottomLeft);
    clotheCard.appendChild(bottomRightOne);
    clotheCard.appendChild(bottomRightTwo);
    clotheCard.appendChild(topRight);

    // Añadir el elemento al contenedor en el documento
    var contenedor = document.getElementById("allClothes");
    contenedor.appendChild(clotheCard);

    let defaultNumber = 0;

    /* Funcionalidad de cada boton */

    let currentValueProduct = parseInt(numberProduct.textContent);

    camisaVector.addEventListener('click', e=>{

        Swal.fire({
            title: `<strong>${product.nombre}</strong>`,
            icon: "info",
            html: `
                  <h2 style="color: #333;"></h2>
                  <p style="color: #666; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Descripción: ${product.descripcion}</p>
                  <p style="color: #666; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Precio: $${product.precio}</p>
                  <p style="color: #666; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Stock: ${product.stock} unidades</p>
              </div>
            `,
            showCloseButton: true,
        });

    })

    bottomLeft.addEventListener('click', e=>{
        if(currentValueProduct!=0){
            agregarProductoAlCarrito(product._id,currentValueProduct)
        }else{
                        
            Swal.fire({
                title: "Productos no agregados",
                text: "No has agregado cuantos productos quieres subir al carrito",
                icon: "question"
            });

        }
        document.querySelector('#numberProduct').innerHTML = defaultNumber;
    })

    bottomRightOne.addEventListener('click', () => {

        if (currentValueProduct < product.stock) {
            currentValueProduct++;
            numberProduct.textContent = currentValueProduct;
        } else {

            Swal.fire({
                title: "No tenemos mas stock de este producto",
                text: "¡Stock máximo alcanzado!",
                icon: "question"
            });

        }

    });

    bottomRightTwo.addEventListener('click', () => {
        
        if (currentValueProduct > 0) {
            currentValueProduct--;            
            numberProduct.textContent = currentValueProduct;
        }

    });
    
}

realizarPeticion()
obtenerProductosCarrito()