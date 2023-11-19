
const validar = () => {

    let inputCE = document.getElementById("inputCE").value;
    let inputCP = document.getElementById("inputCP").value;
    
    if(inputCE !== '' && inputCP !== ''){

        realizarPeticion(inputCE, inputCP);
    
    }else{

        Swal.fire({
            title: "Revisaste los campos?",
            text: "Faltan datos por llenar!",
            icon: "question"
        });

    }

}

const realizarPeticion = (inputCE, inputCP) =>{

    const apiUrl = 'http://localhost/php-html/ProyectoFinal/Backend/Api/LoginApi.php';

    const requestData = {
        user: inputCE,
        password: inputCP
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

        const rol = data[0].RolUsuario;
        const mensaje = data[0].Mensaje;
        const idUser = data[0].UserID;

        if(mensaje == "Inicio de sesion exitoso"){

            sessionStorage.setItem("UserID", idUser)
            obtenerProductosCarrito(idUser, rol)

        }else{

            Swal.fire({
                title: 'Error!',
                text: 'Inicio de sesion fallido!',
                icon: 'error',
                confirmButtonText: 'Ok'
            })

        }

    })
    .catch(error => {

        Swal.fire({
            title: 'Error!',
            text: 'Estamos teniendo problemas con el servicio!',
            icon: 'error',
            confirmButtonText: 'Ok'
        })

        console.error('Error en la solicitud:', error);

    });


}

const obtenerProductosCarrito = (userID, rol) =>{

    const apiUrl = "http://localhost/php-html/ProyectoFinal/Backend/Api/ObtenerQtyProductoCarrito.php";

    const requestData = {
        id: userID
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
        
        if(rol == 'admin'){
            location.href = "../PanelAdmin/admin.html"
        }else if(rol == 'gerente'){
            location.href = "../PanelManager/manager.html"
        }else if(rol == 'serviciocliente'){
            location.href = "../PanelClientService/clientservice.html"
        }else{
            sessionStorage.setItem("qtyCart", data[0].total_registros)
            location.href = "../PanelClient/menu.html"
        }

    })
    .catch(error => {
        console.error('Error en la solicitud:', error);
    });

}

document.getElementById("singup").addEventListener('click', e=>{
    location.href = "./register.html"
})